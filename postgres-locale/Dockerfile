FROM postgres:12.3

MAINTAINER lifei "lifei188(a)xjtu.edu.cn"

ENV TZ=Asia/Shanghai \
    LANG=zh_CN.UTF-8

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
 && localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias $LANG \
 && echo 'LANG="$LANG"' > /etc/default/locale


