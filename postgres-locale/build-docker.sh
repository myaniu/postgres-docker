#!/bin/sh
VERSION=12.3
docker build -t myaniu/postgres:$VERSION .
docker tag myaniu/postgres:$VERSION myaniu/postgres:latest 

docker push myaniu/postgres:$VERSION
docker push myaniu/postgres:latest
