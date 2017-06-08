#!/bin/bash

BIP=127.0.0.1

if command -v docker-machine &>/dev/null; then
  if docker-machine env dclou &>/dev/null; then
    eval $(docker-machine env dclou)
    IP="$(docker-machine ip dclou)"
    echo "Runnung in Virtaul Machine dclou with ip:$IP"
    BIP=$IP
  else
    echo "Runnung on the local station"
  fi
fi

docker stack deploy -c docker-infra-local.yml dclou || exit -1
while ! curl -s http://${BIP}:8761 &>/dev/null; do sleep 2; echo Waiting for discovery server...; done &
while ! curl -s http://${BIP}:8888 &>/dev/null; do sleep 2; echo Waiting for config server...; done &
wait

docker stack deploy -c docker-platform-local.yml dclou
while ! curl -s http://${BIP}:7070 &>/dev/null; do sleep 2; echo Waiting for admin server...; done &
while ! curl -s http://${BIP}:8080 &>/dev/null; do sleep 2; echo Waiting for gateway server...; done &
wait
