#!/usr/bin/env bash

mkdir $PGDATA/conf.d
sed -i "s/#include_dir = '...'/include_dir = 'conf.d'/" "$PGDATA/postgresql.conf"
cp /docker-entrypoint-initdb.d/*.conf $PGDATA/conf.d/

echo "Stop PG"
pg_ctl -D "$PGDATA" -m fast -w stop

echo "Start PG"
pg_ctl -D "$PGDATA" \
	    -o "-c listen_addresses='*'" \
	        -w start

echo "Reload done"
