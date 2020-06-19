#!/bin/sh
#!/bin/sh
VERSION=12.3
docker build -t docker.xjtu.edu.cn/library/postgres-pathman-fdw:$VERSION .
docker tag docker.xjtu.edu.cn/library/postgres-pathman-fdw:$VERSION docker.xjtu.edu.cn/library/postgres-pathman-fdw:latest


docker push docker.xjtu.edu.cn/library/postgres-pathman-fdw:$VERSION
docker push docker.xjtu.edu.cn/library/postgres-pathman-fdw:latest
