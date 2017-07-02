#!/bin/bash

# Usage: make.sh <current user name> <config file name> <server IP>

# download install package and verify md5
if [ ! -e "./logstash-5.4.3.tar.gz" ]
then
    wget https://artifacts.elastic.co/downloads/logstash/logstash-5.4.3.tar.gz
    echo "0086ecf960757f28ca7f48ed70f605159f87c626 *./logstash-5.4.3.tar.gz" | sha1sum -c
fi

# IF YOU CAN NOT DOWNLOAD INSTALL FILE OR YOU BEHIND A FIREWALL,
# PLEASE CONSIDER FOLLOWING SOLUTION
# copy required file to working folder
# cp ../090_Share/logstash-5.4.3.tar.gz .

cp ../090_Share/sources.aliyun.list ./sources.list

# Update config info
sed -i "s/HOST_IP/$3/g" $2
# rename config file
cp ./$2 ./logstash.conf

# change property
chown -R $1:$1 ../../

# build
docker build -t='uguisu/ubuntu1604/logstash543:latest' .
