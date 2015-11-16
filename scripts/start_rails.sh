#!/usr/bin/env bash
if [ "$RAILS_ENV"  == "" ]; then
    RAILS_ENV='development'
fi

if [ "$RAILS_PORT"  == "" ]; then
    RAILS_PORT=3000
fi

echo "Starting Rails server on port $RAILS_PORT"

puma  -p $RAILS_PORT -d -e $RAILS_ENV --pidfile=$RAILS_HOME/tmp/pids/puma.pid >> /dev/null

sleep 10

if [ -f $RAILS_HOME/tmp/pids/puma.pid ]
then
 echo "Rails started in $RAILS_ENV mode on port $RAILS_PORT"
else
 echo "Failed to start Rails in $RAILS_ENV mode. Please see the logs in $RAILS_HOME/log/$RAILS_ENV.log file."
fi

