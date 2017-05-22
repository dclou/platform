#!/bin/sh
docker stack rm dclou
docker volume prune
docker images 'dclou/*' --format '{{.ID}}' | xargs docker rmi
