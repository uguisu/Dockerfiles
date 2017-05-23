#################################################
# Dockerfile for Redis
# Version 1.0.0-Release
# Author: xin.he hexin0614@hotmail.com
#################################################
FROM hub.c.163.com/public/ubuntu:16.04
MAINTAINER xin.he hexin0614@hotmail.com

# declare environment variables
ENV WORK_DIR                   /redis_home
ENV REDIS_INSTALL_FILE_NAME    redis-3.2.9.tar.gz
ENV REDIS_INSTALL_FOLDER_NAME  redis-3.2.9
ENV REDIS_USER_NAME            redis

# prepare system package
## common system update
RUN apt-get update
RUN apt-get -y dist-upgrade

# START INSTALL
## replace source with Aliyun repository
COPY sources.list /etc/apt/
## install required packages
RUN apt-get -y install gcc make build-essential tcl

## create worl folder
RUN mkdir -p $WORK_DIR
## create redis user and group
RUN groupadd -r $REDIS_USER_NAME
RUN useradd  -g $REDIS_USER_NAME $REDIS_USER_NAME -d $WORK_DIR -s /bin/bash

# add Redis package
ADD $REDIS_INSTALL_FILE_NAME $WORK_DIR/

WORKDIR $WORK_DIR/$REDIS_INSTALL_FOLDER_NAME
RUN make distclean
RUN make
RUN make test

# assign ownership to Redis user
RUN chown -R $REDIS_USER_NAME:$REDIS_USER_NAME $WORK_DIR

# switch to new user
USER $REDIS_USER_NAME

# assign basic settings for user
RUN touch ~/.bashrc
RUN echo "alias ls='ls --color=auto'"                                  >> ~/.bashrc
RUN echo "alias ll='ls -alF'"                                          >> ~/.bashrc
RUN echo "export PATH=$WORK_DIR/$REDIS_INSTALL_FOLDER_NAME/src:$PATH"  >> ~/.bashrc

## update Redis config
ENV CONFIG_FILE $WORK_DIR/$REDIS_INSTALL_FOLDER_NAME/redis.conf
RUN sed -i 's/^\(bind .*\)$/# \1/'                     $CONFIG_FILE
RUN sed -i 's/^\(daemonize .*\)$/# \1/'                $CONFIG_FILE
#RUN sed -i 's/^\(dir .*\)$/# \1\ndir \/data'                      $CONFIG_FILE
RUN sed -i 's/^\(logfile .*\)$/# \1/'                  $CONFIG_FILE
RUN sed -i 's/protected-mode yes/protected-mode no/g'  $CONFIG_FILE

# define default command
CMD $WORK_DIR/$REDIS_INSTALL_FOLDER_NAME/src/redis-server $CONFIG_FILE

# export port
EXPOSE 6379
