#!/bin/bash

podman pod ls | grep web >/dev/null
if [ $? == 0 ]; then podman pod stop web; podman pod rm web; fi
podman pod create --name web -p 8080:8080
podman run -d --rm --pod web --name node localhost/example-app
