#!/usr/bin/env bash

. $RAILS_HOME/scripts/app_config.sh

SIDEKIQ_HOME=$RAILS_HOME/components/jobs
echo "Starting Sideqik"
cd $RAILS_HOME

# If redis is already running, exit.
if ( test -f $SIDEKIQ_PID_FILE ) && ( kill -0 `cat $SIDEKIQ_PID_FILE` > /dev/null 2>&1 ); then
    log "Sidekiq already running as process `cat $SIDEKIQ_PID_FILE`."
    exit 1
fi

bundle exec sidekiq  -d -C $RAILS_HOME/components/jobs/config/sidekiq.yml -P $SIDEKIQ_PID_FILE -L $RAILS_HOME/log/sidekiq.log -e $RAILS_ENV

wait_for_start $SIDEKIQ_PID_FILE

echo "Sidekiq process started as daemon"


