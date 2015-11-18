#!/usr/bin/env bash

. $RAILS_HOME/scripts/app_config.sh

bin=`readlink "$0"`
if [ "$bin" == "" ]; then
 bin=$0
fi
bin=`dirname "$bin"`
bin=`cd "$bin"; pwd`

MAX_WAIT_TIME=$1


if [ -f $RAILS_PID_FILE ]; then
  if kill -0 `cat $RAILS_PID_FILE` > /dev/null 2>&1; then
    log_inline "stopping Rails "
    kill `cat $RAILS_PID_FILE`
    wait_for_stop_or_force $RAILS_PID_FILE $MAX_WAIT_TIME
    rm -f $RAILS_PID_FILE
  else
    log "could not stop rails. check that process `cat $RAILS_PID_FILE` exists"
    exit 0
  fi
else
  log "no rails to stop"
fi

sleep 2

if [ -f $RAILS_PID_FILE ]; then
  echo "Failed to stop Rails process at `cat $RAILS_PID_FILE`"
else
  echo "Rails process is stopped"
fi



