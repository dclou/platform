#!/bin/sh
docker swarm init &>/dev/null || true

docker volume create --name data-mongo
docker volume create --name data-prometheus
docker volume create --name data-grafana
docker volume create --name data-logging
docker volume create --name data-elasticsearch

docker-compose -p dclou -f docker-infra.yml up -d
sleep 10
docker-compose -p dclou -f docker-platform.yml up -d
