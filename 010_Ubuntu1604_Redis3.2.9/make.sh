#!/bin/bash

# download redis install package and verify md5
wget http://download.redis.io/releases/redis-3.2.9.tar.gz
echo "3d0a35985b4414c9376b6bcda0ef72ae *./redis-3.2.9.tar.gz" | md5sum -c

# IF YOU CAN NOT DOWNLOAD REDIS INSTALL FILE OR YOU BEHIND A FIREWALL,
# PLEASE CONSIDER FOLLOWING SOLUTION
# copy required file to working folder
# cp ../090_Share/redis-3.2.9.tar.gz .

cp ../090_Share/sources.aliyun.list ./sources.list

# change property
chown -R $1:$1 ../../

# build
docker build -t='uguisu/ubuntu1604/redis329:test' .
