#!/usr/bin/env bash

. $RAILS_HOME/scripts/app_config.sh

bin=`readlink "$0"`
if [ "$bin" == "" ]; then
 bin=$0
fi
bin=`dirname "$bin"`
bin=`cd "$bin"; pwd`

MAX_WAIT_TIME=$1


if [ -f $SIDEKIQ_PID_FILE ]; then
  if kill -0 `cat $SIDEKIQ_PID_FILE` > /dev/null 2>&1; then
    log_inline "stopping Sidekiq "
    kill `cat $SIDEKIQ_PID_FILE`
    wait_for_stop_or_force $SIDEKIQ_PID_FILE $MAX_WAIT_TIME
    rm -f $SIDEKIQ_PID_FILE
  else
    log "could not stop Clockwork. check that process `cat $SIDEKIQ_PID_FILE` exists"
    exit 0
  fi
else
  log "no Sidekiq to stop"
fi

sleep 2

if [ -f $SIDEKIQ_PID_FILE ]; then
  log "Failed to stop Sidekiq process at `cat $SIDEKIQ_PID_FILE`"
else
  log "Sidekiq process is stopped"
fi



