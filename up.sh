#!/bin/bash

dir=`realpath $(dirname $0)`

podman pod ls | grep web >/dev/null
if [ $? == 0 ]; then podman pod stop web; podman pod rm web; fi
pod=`podman pod create --name web -p 8080:8080`

pass=`head /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 32`

podman run -d --rm --pod web --name node -v $dir:/usr/src/app \
	-e PGUSER=postgres \
	-e PGHOST=127.0.0.1 \
	-e PGPASSWORD=$pass \
	-e PGDATABASE=postgres \
	-e PGPORT=5432 \
	localhost/example-app

podman run -d --rm --pod web -v pgdata:/opt/data --name pg \
	-e POSTGRES_PASSWORD=$pass \
	-e PGDATA=/opt/data \
	docker.io/library/postgres

podman run --restart on-failure --pod web -v ./initdb.sql:/opt/initdb.sql --name psql \
	docker.io/library/postgres psql -h 127.0.0.1 -U postgres -f /opt/initdb.sql

podman rm psql
