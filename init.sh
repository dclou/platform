#!/bin/bash

if [ $# -gt 0 ] && [ $1 = "virtualbox" ]; then
  if command -v docker-machine &>/dev/null; then
    docker-machine create -d virtualbox --virtualbox-cpu-count 4 --virtualbox-memory 7096 dclou || true
    eval $(docker-machine env dclou)
    IP="$(docker-machine ip dclou)"
    echo "Working Virtual Machine ip:$IP"
    if [ -z "$IP" ]; then
      echo "*** Error: Cannot get IP address of the virtual machine. Please check it in VirtalBox"
      exit -1
    fi
    docker swarm init --advertise-addr $IP &>/dev/null || true
  else
    echo "*** Error: Docker-Machine must be installed"
    exit -1
  fi
else
  if [ "$(docker version 2>\&1 | grep Server)" ]; then
    echo "Configure local computer as swarm manager"
    docker swarm init &>/dev/null || true
  else
    echo "*** Error: $? Docker service is not running"
    exit -1
  fi
fi

