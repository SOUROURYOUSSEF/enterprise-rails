#! /bin/sh

export RAILS_ENV=production
export DATABASE_HOST=ent_postgres
export DATABASE_PORT=5432
export DATABASE_USER=postgres_rails
export DATABASE_PASSWD=postgres_rails
export DATABASE_RESET=true

#This env. variables will be used by sunspot.yml to connect to Solr
export SOLR_HOST=159.203.122.254
export SOLR_PORT=8983

#This env. variables will be used by sunspot.yml to connect to Solr
export REDIS_HOST=159.203.122.254
export REDIS_PORT=6379

# Following variables are used for SMS integration via Twillio
export TWILIO_ACCOUNT_SID="AC4e2bd58b1c9ebaed6d4c683349a71f75"
export TWILIO_AUTH_TOKEN="16c379b93116aabf180946b5e98ad6dc"
export TWILIO_PHONE_NUMBER="6172199572"
