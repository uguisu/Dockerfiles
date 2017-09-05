# Usage

## Build
    make <username>

## Run
    docker run -d -p 27017:27017 -v <Host DIR>:/data/db uguisu/ubuntu1604/mongodb347:latest

## Remove
    docker rm -v uguisu/ubuntu1604/mongodb347:latest
