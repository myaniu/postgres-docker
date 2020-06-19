#!/bin/sh
VERSION=12.3
docker build -t docker.xjtu.edu.cn/library/postgres-pathman:$VERSION .
docker tag docker.xjtu.edu.cn/library/postgres-pathman:$VERSION docker.xjtu.edu.cn/library/postgres-pathman:latest


docker push docker.xjtu.edu.cn/library/postgres-pathman:$VERSION
docker push docker.xjtu.edu.cn/library/postgres-pathman:latest
