#! /bin/sh

export RAILS_ENV=production
export DATABASE_HOST=ent_postgres
export DATABASE_PORT=5432
export DATABASE_USER=postgres_rails
export DATABASE_PASSWD=postgres_rails

#This env. variables will be used by sunspot.yml to connect to Solr.  IP address of DigitalOcean instance.
# Need to figure out why I can not use hostname instead of IP addr here. Results into runtime error.
export SOLR_HOST=104.131.20.197
#export SOLR_HOST=ent_solr
export SOLR_PORT=8983

#This env. variables will be used by sunspot.yml to connect to Solr
export REDIS_HOST=ent_redis
export REDIS_PORT=6379

#This env. variables will be used by sunspot.yml to connect to locomotive
export CMS_HOST=ent_cms
export CMS_PORT=6379
export CMS_DBPATH=
export CMS_USER=admin
export CMS_PASSWD=ent_rails
export CMS_AUTH_TOKEN=FYjyzNszXkLMbQayoudS
