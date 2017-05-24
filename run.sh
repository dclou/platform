#!/bin/sh

BIP=127.0.0.1

if command -v docker-machine &>/dev/null; then
  docker-machine create -d virtualbox --virtualbox-cpu-count 4 --virtualbox-memory 7096 dclou || true
  eval $(docker-machine env dclou)

  export IP="$(docker-machine ip dclou)"
  docker swarm init --advertise-addr $IP &>/dev/null || true
  BIP=$IP
else
  docker swarm init &>/dev/null || true
fi

docker stack deploy -c docker-infra.yml dclou
while ! curl -s http://${BIP}:8761 &>/dev/null; do sleep 2; echo Waiting for discovery server...; done &
while ! curl -s http://${BIP}:8888 &>/dev/null; do sleep 2; echo Waiting for config server...; done &
wait

docker stack deploy -c docker-platform.yml dclou
while ! curl -s http://${BIP}:7070 &>/dev/null; do sleep 2; echo Waiting for admin server...; done &
while ! curl -s http://${BIP}:8080 &>/dev/null; do sleep 2; echo Waiting for gateway server...; done &
wait
