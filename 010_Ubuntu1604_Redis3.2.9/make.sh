#!/bin/bash

# copy required file to working folder
cp ../090_Share/redis-3.2.9.tar.gz .
cp ../090_Share/sources.aliyun.list ./sources.list

# change property
chown -R $1:$1 ../../

# build
docker build -t='uguisu/ubuntu1604/redis329:test' .
