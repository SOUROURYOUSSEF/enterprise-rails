#!/usr/bin/env bash

. $RAILS_HOME/scripts/app_config.sh

SOLR_HOME=$RAILS_HOME/components/search
SOLR_PID_DIR=$RAILS_HOME/tmp/pids
SOLR_PID_FILE=$SOLR_PID_DIR/sunspot-solr.pid
# If Solr is already running, exit.

if [ -e "$SOLR_PID_FILE" ]
then
    echo "Solr already running as process `cat $SOLR_PID_FILE`."
    exit 0
fi

echo "Starting Solr"
cd $SOLR_HOME


sunspot-solr start -d $SOLR_HOME/spec/dummy/solr/data -b 127.0.0.1 -p 8983 -s $SOLR_HOME/spec/dummy/solr --pid-dir=$SOLR_PID_DIR

wait_for_start $SOLR_PID_DIR/sunspot-solr.pid

echo "Solr process started on port 8983"



