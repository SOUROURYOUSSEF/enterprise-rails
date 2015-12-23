#!/usr/bin/env bash

. $RAILS_HOME/scripts/app_config.sh

if [ -f $POSTGRES_PID_FILE ]; then
  if kill -0 `head -1 $POSTGRES_PID_FILE` > /dev/null 2>&1; then
    log "Postgres already running as process `head -1 $POSTGRES_PID_FILE`."
    exit 0
  fi
fi

# MAX_CONNECTIONS=$($RUBY $RAILS_HOME/config/update_database_thread_count.rb)

MAX_CONNECTIONS=100

log "Setting maximum database connections to $MAX_CONNECTIONS"

if [ ! -d $POSTGRES_DATA_DIR ]; then
log_inline "Setting up PostgreSQL database cluster"
$POSTGRES_HOME/bin/initdb --encoding=UTF8 --pgdata=$POSTGRES_DATA_DIR
fi

log "Starting PostgreSQL"
DYLD_LIBRARY_PATH=$POSTGRES_HOME/lib LD_LIBRARY_PATH=$POSTGRES_HOME/lib $POSTGRES_HOME/bin/pg_ctl -l $POSTGRES_DATA_DIR/server.log -D $POSTGRES_DATA_DIR -w -o "-N$MAX_CONNECTIONS -p$POSTGRES_PORT -h127.0.0.1 --bytea_output=escape" start &>$POSTGRES_DATA_DIR/pg_ctl.log
POSTGRES_START=$?

if [ $POSTGRES_START -eq 0 ]; then
    wait_for_start $POSTGRES_PID_FILE
    log "postgres started as pid `head -1 $POSTGRES_PID_FILE`"
#    log "Creating database user for the first time"
#    DYLD_LIBRARY_PATH=$POSTGRES_HOME/lib LD_LIBRARY_PATH=$POSTGRES_HOME/lib $POSTGRES_HOME/bin/createuser -hlocalhost -p $POSTGRES_PORT -sdr ent_rails

else
    log "postgres failed to start, see $POSTGRES_DATA_DIR/server.log for details"
    exit $POSTGRES_START
fi
