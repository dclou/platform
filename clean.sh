#!/bin/sh
docker stack rm dclou
docker volume prune
docker images 'dclou/*' --format '{{.ID}}' | xargs docker rmi -f
unset DOCKER_HOST DOCKER_MACHINE_NAME DOCKER_TLS_VERIFY DOCKER_CERT_PATH
