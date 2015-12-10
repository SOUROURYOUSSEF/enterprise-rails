#! /bin/sh

export RAILS_ENV=production
export RAILS_PORT=3000
export SECRET_KEY_BASE=c733aabc894e4464031641d68f9c2066df51d177d793f462892b20ec8c50df7c06aa30fdd1153c19e6487684254fface62f09af847ad4cfb85c537d84e3e3a38
export DATABASE_HOST=ent_postgres
export DATABASE_PORT=5432
export DATABASE_USER=postgres_rails
export DATABASE_PASSWD=postgres_rails

#This env. variables will be used by sunspot.yml to connect to Solr.  IP address of docker-machine.
# Need to figure out why I can not use docker-compose generated hostname instead of IP address here.
export SOLR_HOST=192.168.0.20
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
