#!/usr/bin/env bash
bin=`readlink "$0"`
if [ "$bin" == "" ]; then
 bin=$0
fi
bin=`dirname "$bin"`
bin=`cd "$bin"; pwd`

REDIS_PID_FILE=$APP_HOME/tmp/pids/redis.pid

MAX_WAIT_TIME=$1

# User redis-cli to properly shutdown redis
redis-cli shutdown

sleep 2

if [ -f $REDIS_PID_FILE ]; then
  echo "Failed to stop Redis process at `cat $REDIS_PID_FILE`"
else
  echo "Redis process is stopped"
fi
