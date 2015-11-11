#!/usr/bin/env bash

echo "Starting Rails on Puma on port 3001"

puma  -p 3001 -d --pidfile=./tmp/pids/puma.pid
