#!/usr/bin/env bash

. $RAILS_HOME/scripts/app_config.sh

REDIS_HOME=$RAILS_HOME/components/jobs
echo "Starting Redis"
cd $REDIS_HOME
# echo $PWD
# If redis is already running, exit.
if ( test -f $REDIS_PID_FILE ) && ( kill -0 `cat $REDIS_PID_FILE` > /dev/null 2>&1 ); then
    log "REDIS already running as process `cat $REDIS_PID_FILE`."
    exit 1
fi

# NOTE: see redis.conf for options to store PID etc.
bundle exec redis-server $REDIS_HOME/config/redis.conf

wait_for_start $REDIS_PID_FILE

echo "Redis process started as daemon"


