#!/usr/bin/env bash

SOLR_HOME=$RAILS_HOME/components/search
echo "Stopping Solr"
cd $SOLR_HOME
bundle exec rake app:sunspot:solr:stop
