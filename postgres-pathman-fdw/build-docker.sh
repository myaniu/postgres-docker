#!/bin/sh
#!/bin/sh
VERSION=12.3
docker build -t myaniu/postgres-pathman-fdw:$VERSION .
docker tag myaniu/postgres-pathman-fdw:$VERSION myaniu/postgres-pathman-fdw:latest


docker push myaniu/postgres-pathman-fdw:$VERSION
docker push myaniu/postgres-pathman-fdw:latest
