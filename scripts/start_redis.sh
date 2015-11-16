#!/usr/bin/env bash

REDIS_HOME=$RAILS_HOME/components/jobs
echo "Starting Redis"
cd $REDIS_HOME
echo $PWD
bundle exec redis-server $REDIS_HOME/config/redis.conf

