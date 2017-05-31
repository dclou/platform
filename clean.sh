#!/bin/bash

IP="$(docker-machine ip dclou)"
if [ "$IP" ]; then
  echo "Using virtual machine dclou"
  eval $(docker-machine env dclou)
else
  echo "Using local computer"
fi

docker stack rm dclou
docker volume prune
docker images 'dclou/*' --format '{{.ID}}' | xargs docker rmi -f
