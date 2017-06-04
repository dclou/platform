#!/bin/bash

ps | grep "./run.sh" | grep -v grep | awk '{print $1}' | xargs kill