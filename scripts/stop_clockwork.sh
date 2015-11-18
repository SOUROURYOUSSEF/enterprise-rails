#!/usr/bin/env bash

. $RAILS_HOME/scripts/app_config.sh

bin=`readlink "$0"`
if [ "$bin" == "" ]; then
 bin=$0
fi
bin=`dirname "$bin"`
bin=`cd "$bin"; pwd`

MAX_WAIT_TIME=$1


if [ -f $CLOCKWORK_PID_FILE ]; then
  if kill -0 `cat $CLOCKWORK_PID_FILE` > /dev/null 2>&1; then
    log_inline "stopping Clockwork "
    kill `cat $CLOCKWORK_PID_FILE`
    wait_for_stop_or_force $CLOCKWORK_PID_FILE $MAX_WAIT_TIME
    rm -f $CLOCKWORK_PID_FILE
  else
    log "could not stop Clockwork. check that process `cat $CLOCKWORK_PID_FILE` exists"
    exit 0
  fi
else
  log "no rails to stop"
fi

sleep 2

if [ -f $CLOCKWORK_PID_FILE ]; then
  echo "Failed to stop Clockwork process at `cat $CLOCKWORK_PID_FILE`"
else
  echo "Clockwork process is stopped"
fi



