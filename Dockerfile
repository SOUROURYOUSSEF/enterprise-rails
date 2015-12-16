FROM ruby:2.2
RUN apt-get update \
    && apt-get install -y build-essential nodejs npm nodejs-legacy postgresql-client emacs nginx
RUN npm install -g phantomjs
RUN mkdir /myapp
RUN mkdir /myapp/tmp
RUN mkdir /myapp/tmp/pids
RUN mkdir /myapp/tmp/sockets

RUN mkdir /tmp/gems

# WORKDIR /tmp/gems
COPY Gemfile.app Gemfile.app
RUN bundle install --gemfile=Gemfile.app --without development test

ADD . /myapp

WORKDIR /myapp

# VOLUME .:/myapp

ENV RAILS_ENV=production
ENV RAILS_PORT=3000
ENV RAILS_HOME=/myapp
ENV SECRET_KEY_BASE=c733aabc894e4464031641d68f9c2066df51d177d793f462892b20ec8c50df7c06aa30fdd1153c19e6487684254fface62f09af847ad4cfb85c537d84e3e3a38

#c733aabc894e4464031641d68f9c2066df51d177d793f462892b20ec8c50df7c06aa30fdd1153c19e6487684254fface62f09af847ad4cfb85c537d84e3e3a38


# bundle install needs to be after adding rails dir since Gemfile refers to engines in components dir of app.

# RUN bundle install

RUN bundle install --gemfile=Gemfile --without development test


EXPOSE 3000
# expose nginx default port
EXPOSE 80

#This env. variables will be used by database.yml to connect to postgresSQL
ENV DATABASE_HOST=ent_postgres
ENV DATABASE_PORT=5432
ENV DATABASE_USER=postgres_rails
ENV DATABASE_PASSWD=QEVuQwEA1i1wt1NtbWKg2o7+Jupbsg==
ENV SECRET_KEY=

#This env. variables will be used by sunspot.yml to connect to Solr
ENV SOLR_HOST=192.168.0.20
ENV SOLR_PORT=8983

#This env. variables will be used by sunspot.yml to connect to Solr
ENV REDIS_HOST=ent_redis
ENV REDIS_PORT=6379
ENV REDIS_URL=redis://ent_redis:6379

# process env. variables on redis.conf file. Redis does not support env variables in its configuration file.
RUN erb ./config/redis.conf.erb > ./config/redis.conf

# remove default configuration
RUN rm /etc/nginx/sites-enabled/default

ADD ./config/nginx.conf /etc/nginx/sites-enabled/webapp.conf

# copy assymetric encryption keys from host to container. These keys MUST be carried over to maintain encryption/decryption to work across environments.
# ADD /etc/rails/keys /etc/rails/keys

RUN mkdir -p /etc/rails/keys

RUN bundle exec rails generate symmetric_encryption:new_keys production

# start nginx service (as root)
# RUN service nginx start


# RUN rm -f /etc/service/nginx/down

# You have to run this CMD with 0.0.0.0 IP address for port mapping to work in Docker container. Very strange.
# NOTE: the rake commands are being run here before starting rails to setup database. There has to be a better way. Need to investigate.
CMD rake docker:db:setup \
    && rake assets:precompile \
    && ./scripts/start_sidekiq.sh \
    && ./scripts/start_clockwork.sh \
    && service nginx restart \
    && puma -C config/puma.rb












