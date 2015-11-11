#!/usr/bin/env bash

SOLR_HOME=$RAILS_HOME/components/search
echo "Starting Solr"
cd $SOLR_HOME
echo $PWD
bundle exec rake app:sunspot:solr:start
