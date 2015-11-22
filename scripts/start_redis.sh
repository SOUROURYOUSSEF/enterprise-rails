#!/usr/bin/env bash

. $RAILS_HOME/scripts/app_config.sh

cur_dir=$PWD

echo "Starting Redis Server"
cd $RAILS_HOME
echo $PWD
# If redis is already running, exit.
if ( test -f $REDIS_PID_FILE )
then
    log "REDIS already running as process `cat $REDIS_PID_FILE`."
    exit 1
fi

# NOTE: see redis.conf for options to store PID etc.
redis-server $RAILS_HOME/config/redis.conf

wait_for_start $REDIS_PID_FILE

echo "Redis process started as daemon"


