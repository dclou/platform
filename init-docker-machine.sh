#!/bin/bash
docker-machine create -d virtualbox --virtualbox-cpu-count 4 --virtualbox-memory 7096 dclou
eval $(docker-machine env dclou)
docker swarm init --advertise-addr $IP
