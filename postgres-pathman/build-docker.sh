#!/bin/sh
VERSION=12.3
docker build -t myaniu/postgres-pathman:$VERSION .
docker tag myaniu/postgres-pathman:$VERSION myaniu/postgres-pathman:latest


docker push myaniu/postgres-pathman:$VERSION
docker push myaniu/postgres-pathman:latest
