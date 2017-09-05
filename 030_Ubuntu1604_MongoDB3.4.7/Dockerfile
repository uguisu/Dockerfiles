#################################################
# Dockerfile for mongoDB
# Version 1.0.0-Release
# Author: xin.he hexin0614@hotmail.com
#################################################
FROM hub.c.163.com/public/ubuntu:16.04
MAINTAINER xin.he hexin0614@hotmail.com

# declare environment variables
ENV WORK_DIR                     /mongodb_home
ENV MONGODB_INSTALL_FILE_NAME    mongodb-linux-x86_64-ubuntu1604-3.4.7.tgz
ENV MONGODB_INSTALL_FOLDER_NAME  mongodb-linux-x86_64-ubuntu1604-3.4.7
ENV MONGODB_DATA_DIR             /data/db

# prepare system package
## replace source with Aliyun repository
# COPY sources.list /etc/apt/
## common system update
RUN \
    apt-get update && \
    apt-get check  && \
    apt-get -y autoremove    && \
    apt-get -y dist-upgrade  && \
    apt-get -y autoclean

## create work folder
RUN mkdir -p $WORK_DIR
RUN mkdir -p $MONGODB_DATA_DIR

# add mongodb package
ADD $MONGODB_INSTALL_FILE_NAME $WORK_DIR/

WORKDIR $WORK_DIR/$MONGODB_INSTALL_FOLDER_NAME

# assign basic settings for user
RUN \
    touch ~/.bashrc   && \
    echo "alias ls='ls --color=auto'"                                  >> ~/.bashrc         && \
    echo "alias ll='ls -alF'"                                          >> ~/.bashrc         && \
    echo "export PATH=$WORK_DIR/$MONGODB_INSTALL_FOLDER_NAME/bin:/bin:$PATH"  >> ~/.bashrc
#    mkdir -p /data/db

# Define mountable directories.
VOLUME /data/db

# define default command
CMD $WORK_DIR/$MONGODB_INSTALL_FOLDER_NAME/bin/mongod

# export port
EXPOSE 27017
EXPOSE 28017
