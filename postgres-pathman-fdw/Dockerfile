FROM postgres:12.3

MAINTAINER lifei "lifei188(a)xjtu.edu.cn"

ENV TZ=Asia/Shanghai \
    LANG=zh_CN.UTF-8 \
    ORACLE_HOME=/Oracle \
    LD_LIBRARY_PATH=/Oracle \
    PG_PATHMAN_VERSION=1.5.11 \
    ORACLE_VERSION=19.6.0.0.0 \
    ORACLE_DIR_NAME=instantclient_19_6 \
    ORACLE_FDW_VERSION=2_2_0 \
    TDS_FDW_VERSION=2.0.1 \
    PG_CRON_VERSION=1.2.0 \
    MYSQL_MAJOR=8.0 \
    MYSQL_VERSION=8.0.20 \
    MYSQL_FDW_VERSION=2_5_3

RUN set -x \
#set timezone and lang
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias $LANG \
    && echo 'LANG="$LANG"' > /etc/default/locale \
# install dev
    && apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates wget unzip make postgresql-server-dev-"${PG_MAJOR}" gcc libc6-dev libssl-dev libkrb5-dev libaio1 libsybdb5 freetds-dev freetds-common gnupg \
# install pg_pathman
    && wget -O /tmp/pg_pathman.zip https://github.com/postgrespro/pg_pathman/archive/"${PG_PATHMAN_VERSION}".zip \
    && unzip /tmp/pg_pathman.zip  -d /tmp \
    && cd /tmp/pg_pathman-"${PG_PATHMAN_VERSION}"\
    && make USE_PGXS=1 install \
#install oracle_fdw
    && wget -O /tmp/instantclient-basic.zip  https://download.oracle.com/otn_software/linux/instantclient/19600/instantclient-basiclite-linux.x64-"${ORACLE_VERSION}"dbru.zip \
    && wget -O /tmp/instantclient-sdk.zip  https://download.oracle.com/otn_software/linux/instantclient/19600/instantclient-sdk-linux.x64-"${ORACLE_VERSION}"dbru.zip \
    && unzip /tmp/instantclient-basic.zip -d /tmp/Oracle \
    && unzip /tmp/instantclient-sdk.zip -d /tmp/Oracle \
    && mv /tmp/Oracle/"${ORACLE_DIR_NAME}" /Oracle \
    && rm -f /Oracle/ojdbc8.jar /Oracle/ucp.jar /Oracle/xstreams.jar \
    && wget -O /tmp/oracle_fdw.zip  https://github.com/laurenz/oracle_fdw/archive/ORACLE_FDW_"${ORACLE_FDW_VERSION}".zip \
    && unzip /tmp/oracle_fdw.zip  -d /tmp \
    && cd /tmp/oracle_fdw-ORACLE_FDW_"${ORACLE_FDW_VERSION}" \
    && make USE_PGXS=1 install \
#install tds_fdw
    && wget -O /tmp/tds_fdw.zip https://github.com/tds-fdw/tds_fdw/archive/v"${TDS_FDW_VERSION}".zip \
    && unzip /tmp/tds_fdw.zip  -d /tmp \
    && cd /tmp/tds_fdw-"${TDS_FDW_VERSION}" \
    && make USE_PGXS=1 install \
#install pg_cron
    && wget -O /tmp/pg_cron.zip https://github.com/citusdata/pg_cron/archive/v"${PG_CRON_VERSION}".zip \
    && unzip /tmp/pg_cron.zip  -d /tmp \
    && cd /tmp/pg_cron-"${PG_CRON_VERSION}" \
    && make && make install \
#install mysql_fdw
    && wget  -O /tmp/mysql-common.deb https://dev.mysql.com/get/Downloads/MySQL-"${MYSQL_MAJOR}"/mysql-common_"${MYSQL_VERSION}"-1debian10_amd64.deb \
    && wget  -O /tmp/libmysqlclient.deb https://dev.mysql.com/get/Downloads/MySQL-"${MYSQL_MAJOR}"/libmysqlclient21_"${MYSQL_VERSION}"-1debian10_amd64.deb \
    && wget  -O /tmp/libmysqlclient-dev.deb https://dev.mysql.com/get/Downloads/MySQL-"${MYSQL_MAJOR}"/libmysqlclient-dev_"${MYSQL_VERSION}"-1debian10_amd64.deb \
    && dpkg -i /tmp/mysql-common.deb /tmp/libmysqlclient.deb /tmp/libmysqlclient-dev.deb \
    && wget -O /tmp/mysql_fdw.zip https://github.com/EnterpriseDB/mysql_fdw/archive/REL-"${MYSQL_FDW_VERSION}".zip \
    && unzip /tmp/mysql_fdw.zip  -d /tmp \
    && cd /tmp/mysql_fdw-REL-"${MYSQL_FDW_VERSION}" \
    && make USE_PGXS=1 install \
#install clean
    && apt-get purge -y --auto-remove wget unzip make gnupg gcc postgresql-server-dev-"${PG_MAJOR}" libc6-dev libssl-dev libkrb5-dev \
    && apt-get autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /Oracle.tar.gz \
    && rm -rf /tmp/*

COPY docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d/
COPY docker-entrypoint-after-initdb.sh /docker-entrypoint-initdb.d/0-docker-entrypoint-after-initdb.sh

