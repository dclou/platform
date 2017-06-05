#!/bin/bash

#ps | grep "./run.sh" | grep -v grep | awk '{print $1}' | xargs kill
ps | grep "./local_run.sh" | grep -v grep | awk '{print $1}' | xargs kill