#!/usr/bin/env bash

. $RAILS_HOME/scripts/app_config.sh


MAX_WAIT_TIME=$1

if [ -f $POSTGRES_PID_FILE ]; then
  if kill -0 `cat $POSTGRES_PID_FILE` > /dev/null 2>&1; then
    log_inline "stopping postgres "
    $POSTGRES_HOME/bin/pg_ctl -D $POSTGRES_DATA_DIR -m fast stop > /dev/null
    EXIT_CODE=$?
    if [ $EXIT_CODE -eq 0 ]; then
        wait_for_stop_or_force $POSTGRES_PID_FILE $MAX_WAIT_TIME
    fi
    exit $EXIT_CODE
  else
    log "no postgres to stop"
    rm -f $POSTGRES_PID_FILE
    exit 0
  fi
else
  log "no postgres to stop"
  exit 0
fi
