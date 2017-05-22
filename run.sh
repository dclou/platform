#!/bin/sh
docker swarm init &>/dev/null || true

docker stack deploy -c docker-infra.yml dclou
docker stack deploy -c docker-platform.yml dclou


