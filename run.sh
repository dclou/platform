#!/bin/sh
docker-compose -p dclou -f docker-infra.yml up -d
sleep 10
docker-compose -p dclou -f docker-platform.yml up -d
