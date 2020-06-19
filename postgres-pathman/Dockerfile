FROM postgres:12.3

MAINTAINER lifei "lifei188(a)xjtu.edu.cn"

ENV TZ=Asia/Shanghai \
    LANG=zh_CN.UTF-8

ARG PG_PATHMAN_VERSION=1.5.11
    
RUN set -x \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias $LANG \
    && echo 'LANG="$LANG"' > /etc/default/locale \
    && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget unzip make postgresql-server-dev-$PG_MAJOR gcc libc6-dev libssl-dev libkrb5-dev \
    && wget -O /tmp/pg_pathman.zip https://github.com/postgrespro/pg_pathman/archive/$PG_PATHMAN_VERSION.zip \
    && unzip /tmp/pg_pathman.zip  -d /tmp \
    && cd /tmp/pg_pathman-$PG_PATHMAN_VERSION \
    && make USE_PGXS=1 install \
    && cd /tmp \
    && apt-get purge -y --auto-remove ca-certificates wget unzip make postgresql-server-dev-$PG_MAJOR gcc libc6-dev libssl-dev libkrb5-dev \
    && apt-get autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*


COPY docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d/
COPY docker-entrypoint-after-initdb.sh /docker-entrypoint-initdb.d/0-docker-entrypoint-after-initdb.sh

