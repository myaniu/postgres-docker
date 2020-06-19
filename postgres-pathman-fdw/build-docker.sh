#!/bin/sh
#!/bin/sh
VERSION=12.3
docker build -t myaniu/library/postgres-pathman-fdw:$VERSION .
docker tag myaniu/library/postgres-pathman-fdw:$VERSION myaniu/library/postgres-pathman-fdw:latest


docker push myaniu/library/postgres-pathman-fdw:$VERSION
docker push myaniu/library/postgres-pathman-fdw:latest
