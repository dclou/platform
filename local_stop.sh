#!/bin/bash

docker-compose -f docker-dev.yml down --remove-orphans
docker-compose -f docker-platform.yml down --remove-orphans
docker-compose -f docker-infra.yml down --remove-orphans
