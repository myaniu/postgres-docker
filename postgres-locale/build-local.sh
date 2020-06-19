#!/bin/sh
VERSION=12.3
docker build -t docker.xjtu.edu.cn/library/postgres:$VERSION .
docker tag docker.xjtu.edu.cn/library/postgres:$VERSION docker.xjtu.edu.cn/library/postgres:latest

docker push docker.xjtu.edu.cn/library/postgres:$VERSION
docker push docker.xjtu.edu.cn/library/postgres:latest
