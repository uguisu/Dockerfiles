#!/bin/bash

# Usage: make.sh <current user name>

# download install package and verify md5
if [ ! -e "./mongodb-linux-x86_64-ubuntu1604-3.4.7.tgz" ]
then
    wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1604-3.4.7.tgz
#    echo "0086ecf960757f28ca7f48ed70f605159f87c626 *./logstash-5.4.3.tar.gz" | sha1sum -c
fi

# IF YOU CAN NOT DOWNLOAD INSTALL FILE OR YOU BEHIND A FIREWALL,
# PLEASE CONSIDER FOLLOWING SOLUTION
# copy required file to working folder
# cp ../090_Share/mongodb-linux-x86_64-ubuntu1604-3.4.7.tgz .

# Change source
# cp ../090_Share/sources.aliyun.list ./sources.list

# change property
chown -R $1:$1 ../../

# build
docker build -t='uguisu/ubuntu1604/mongodb347:latest' .
