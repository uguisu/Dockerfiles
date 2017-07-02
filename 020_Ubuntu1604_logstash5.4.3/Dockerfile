#################################################
# Dockerfile for Logstash
# Version 1.0.0-Release
# Author: xin.he hexin0614@hotmail.com
#################################################
FROM hub.c.163.com/public/ubuntu:16.04
MAINTAINER xin.he hexin0614@hotmail.com

# declare environment variables
ENV WORK_DIR                     /logstash_home
ENV LOGSTASH_INSTALL_FILE_NAME    logstash-5.4.3.tar.gz
ENV LOGSTASH_INSTALL_FOLDER_NAME  logstash-5.4.3
ENV LOGSTASH_CONFIG_FILE_NAME     logstash.conf

# prepare system package
## replace source with Aliyun repository
COPY sources.list /etc/apt/
## common system update
RUN apt-get update
RUN apt-get check
RUN apt-get -y autoremove
RUN apt-get -y dist-upgrade
RUN apt-get -y autoclean

# START INSTALL
## install required packages
RUN apt-get -y install openjdk-8-jre

## create work folder
RUN mkdir -p $WORK_DIR

# add logstash package
ADD $LOGSTASH_INSTALL_FILE_NAME $WORK_DIR/
ADD $LOGSTASH_CONFIG_FILE_NAME  $WORK_DIR/

WORKDIR $WORK_DIR/$LOGSTASH_INSTALL_FOLDER_NAME

# assign basic settings for user
RUN touch ~/.bashrc
RUN echo "alias ls='ls --color=auto'"                                  >> ~/.bashrc
RUN echo "alias ll='ls -alF'"                                          >> ~/.bashrc
RUN echo "export PATH=$WORK_DIR/$LOGSTASH_INSTALL_FOLDER_NAME/bin:/bin:$PATH"  >> ~/.bashrc

# define default command
CMD $WORK_DIR/$LOGSTASH_INSTALL_FOLDER_NAME/bin/logstash -f $WORK_DIR/$LOGSTASH_CONFIG_FILE_NAME

# export port
EXPOSE 9200
