FROM ruby:2.2
RUN apt-get update \
    && apt-get install -y build-essential nodejs npm nodejs-legacy postgresql-client emacs
RUN npm install -g phantomjs
RUN mkdir /myapp
RUN mkdir /tmp/gems

# WORKDIR /tmp/gems
# COPY Gemfile Gemfile
# COPY Gemfile.lock Gemfile.lock
# RUN bundle install

ADD . /myapp

WORKDIR /myapp

# VOLUME .:/myapp

ENV RAILS_ENV=production
ENV RAILS_HOME=/myapp


# bundle install needs to be after adding rails dir since Gemfile refers to engines in components dir of app.

RUN bundle install

EXPOSE 3000
#This env. variables will be used by database.yml to connect to postgresSQL
ENV DATABASE_HOST=ent_postgres
ENV DATABASE_PORT=5432
ENV DATABASE_USER=postgres_rails
ENV DATABASE_PASSWD=postgres_rails

#This env. variables will be used by sunspot.yml to connect to Solr
ENV SOLR_HOST=192.168.0.20
ENV SOLR_PORT=8983

#This env. variables will be used by sunspot.yml to connect to Solr
ENV REDIS_HOST=192.168.0.20
ENV REDIS_PORT=6379

RUN erb ./config/redis.conf.erb > ./config/redis.conf

# You have to run this CMD with 0.0.0.0 IP address for port mapping to work in Docker container. Very strange.
# NOTE: the rake commands are being run here before starting rails to setup database. There has to be a better way. Need to investigate.
CMD rake db:drop \
    && rake db:create \
    && rake db:migrate \
    && rake sample_data:load \
    && rake authorization:seed \
    && rake assets:precompile \
    && ./scripts/start_sidekiq.sh \
    && ./scripts/start_clockwork.sh \
    && rails server -b 0.0.0.0











