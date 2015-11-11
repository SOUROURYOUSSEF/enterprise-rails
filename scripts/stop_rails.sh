#!/usr/bin/env bash
bin=`readlink "$0"`
if [ "$bin" == "" ]; then
 bin=$0
fi
bin=`dirname "$bin"`
bin=`cd "$bin"; pwd`

MAX_WAIT_TIME=$1
RAILS_PID_FILE=$RAILS_HOME/tmp/pids/puma.pid

DEFAULT_WAIT_TIME=5
function wait_for_stop_or_force () {
    pid_file=$1

    MAX_WAIT_TIME=${2:-$DEFAULT_WAIT_TIME} # this awful notation means use parameter $2 if not null, else use value $DEFAULT_WAIT_TIME.
    time_waited=0
    while kill -0 `head -1 $pid_file 2>/dev/null` > /dev/null 2>&1
    do
        echo -n "."
        sleep 1

        # Negative values -> indefinite wait
        if [ "$MAX_WAIT_TIME" -lt "0" ]; then
            continue
        fi

        # Else only wait at most MAX_WAIT_TIME
        let "time_waited++"
        if [ "$time_waited" -gt "$MAX_WAIT_TIME" ]; then
            echo " ( Forcing stop since > $MAX_WAIT_TIME sec. elapsed )"
            kill -9 `head -1 $pid_file 2>/dev/null` > /dev/null 2>&1
            break
        fi
    done
    echo " ( Stopped )"
}

function log () {
    echo "[$RAILS_ENV] $1"
}

function log_inline () {
    echo -n "[$RAILS_ENV] $1"
}


if [ -f $RAILS_PID_FILE ]; then
  if kill -0 `cat $RAILS_PID_FILE` > /dev/null 2>&1; then
    log_inline "stopping Rails "
    kill `cat $RAILS_PID_FILE`
    wait_for_stop_or_force $RAILS_PID_FILE $MAX_WAIT_TIME
    # rm -f $RAILS_PID_FILE
  else
    log "could not stop rails. check that process `cat $RAILS_PID_FILE` exists"
    exit 0
  fi
else
  log "no rails to stop"
fi



