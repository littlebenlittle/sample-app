#!/bin/bash

dir=`realpath $(dirname $0)`

podman pod ls | grep web >/dev/null
if [ $? == 0 ]; then podman pod stop web; podman pod rm web; fi
podman pod create --name web -p 8080:8080
pass=`head /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 32`

podman run -d --rm --pod web --name node -v $dir:/usr/src/app \
	-e PGUSER=postgres \
	-e PGHOST=127.0.0.1 \
	-e PGPASSWORD=$pass \
	-e PGDATABASE=postgres \
	-e PGPORT=5432 \
	localhost/example-app

podman run -d --rm --pod web --name pg \
	-e POSTGRES_PASSWORD=$pass \
	docker.io/library/postgres
