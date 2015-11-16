#!/usr/bin/env bash
bin=`readlink "$0"`
if [ "$bin" == "" ]; then
 bin=$0
fi
bin=`dirname "$bin"`
bin=`cd "$bin"; pwd`

REDIS_PID_FILE=$APP_HOME/tmp/pids/redis.pid

MAX_WAIT_TIME=$1

if [ -f $REDIS_PID_FILE ]; then
  if kill -2 `cat $REDIS_PID_FILE` > /dev/null 2>&1; then
    log_inline "stopping indexer "
    kill `cat $REDIS_PID_FILE`
    wait_for_stop_or_force $REDIS_PID_FILE $MAX_WAIT_TIME
    rm -f $REDIS_PID_FILE
  else
    log "could not stop redis. check that process `cat $REDIS_PID_FILE` exists"
    exit 0
  fi
else
  log "no redis to stop"
fi
