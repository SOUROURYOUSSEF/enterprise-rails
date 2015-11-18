#!/usr/bin/env bash

SOLR_HOME=$RAILS_HOME/components/search
echo "Stopping Solr"
cd $SOLR_HOME
#!/usr/bin/env bash

SOLR_PID_DIR=$RAILS_HOME/tmp/pids
SOLR_PID_FILE=$SOLR_PID_DIR/sunspot-solr.pid

sunspot-solr stop -d $SOLR_HOME/spec/dummy/solr/data -b 127.0.0.1 -p 8983 -s $SOLR_HOME/spec/dummy/solr --pid-dir=$SOLR_PID_DIR

sleep 2

if [ -e $SOLR_PID_FILE ]
then
  echo "Failed to stop Rails process at `cat $RAILS_PID_FILE`"
else
  echo "Solr process is stopped"
fi
