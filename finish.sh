#!/bin/bash

IP="$(docker-machine ip dclou 2>&1)"
NODOC=$(echo $IP | egrep -o "^[^ ]+")
if [ "$NODOC" != "Host" ]; then
  echo "Using virtual machine dclou"
  eval $(docker-machine env dclou)
  docker swarm leave --force
  docker-machine stop dclou
  docker-machine rm dclou
  unset DOCKER_HOST DOCKER_MACHINE_NAME DOCKER_TLS_VERIFY DOCKER_CERT_PATH
else
  echo "Using local computer"
  docker swarm leave --force
fi

