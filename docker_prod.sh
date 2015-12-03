#! /bin/sh

export RAILS_ENV=development
export DATABASE_HOST=ent_postgres
export DATABASE_PORT=5432
export DATABASE_USER=postgres_rails
export DATABASE_PASSWD=postgres_rails

#This env. variables will be used by sunspot.yml to connect to Solr
export SOLR_HOST=ent_solr
export SOLR_PORT=8983

#This env. variables will be used by sunspot.yml to connect to Solr
export REDIS_HOST=ent_redis
export REDIS_PORT=6379

