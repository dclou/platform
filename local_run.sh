#!/bin/bash

BIP=127.0.0.1

docker-compose -f docker-infra.yml up -d
while ! curl -s http://${BIP}:8761 &>/dev/null; do sleep 2; echo Waiting for discovery server...; done &
while ! curl -s http://${BIP}:8888 &>/dev/null; do sleep 2; echo Waiting for config server...; done &
wait


docker-compose -f docker-platform.yml up -d
while ! curl -s http://${BIP}:7070 &>/dev/null; do sleep 2; echo Waiting for admin server...; done &
while ! curl -s http://${BIP}:8080 &>/dev/null; do sleep 2; echo Waiting for gateway server...; done &
wait

docker-compose -f docker-dev.yml up -d
