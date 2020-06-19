# postgres-docker

#

# postgres-local
* 在postgres官方的基础上添加TZ时区环境变量和LANG默认语言变量
* 可以在运行时通过添加 -e TZ=Asia/Shanghai 和 -e LANG=zh_CN.UTF-8 来改变时区和环境变量
* 默认时区Asia/Shanghai，默认语言zh_CN.UTF-8

# 

# postgres-pathman
* 除postgres-local功能外，添加pg_pathman表分区扩展。

# 

# postgres-pathman-fdw
* 除postgres-pathman功能外，添加mysql_fdw，oracle_fdw，tds_fdw（mssql）主流数据库的FDW支持。
* 除postgres-pathman功能外，添加pg_cron 定时计划扩展

