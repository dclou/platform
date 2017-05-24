#!/bin/sh
docker-machine create -d virtualbox --virtualbox-cpu-count 4 --virtualbox-memory 7096 dclou || true
eval $(docker-machine env dclou)

export IP="$(docker-machine ip dclou)"
docker swarm init --advertise-addr $IP &>/dev/null || true

docker stack deploy -c docker-infra.yml dclou
docker stack deploy -c docker-platform.yml dclou


