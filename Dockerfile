FROM ruby:2.2
RUN apt-get update \
    && apt-get install -y build-essential nodejs npm nodejs-legacy postgresql-client emacs
RUN npm install -g phantomjs
RUN mkdir /myapp
RUN mkdir /tmp/components

# WORKDIR /tmp
# COPY Gemfile Gemfile
#COPY Gemfile.lock Gemfile.lock


ADD . /myapp

WORKDIR /myapp
ENV RAILS_ENV=development

# bundle install needs to be after adding rails dir since Gemfile refers to engines in components dir of app.
RUN bundle install

EXPOSE 3000
#This env. variables will be used by database.yml to connect to postgresSQL
ENV DATABASE_HOST=192.168.0.20
ENV DATABASE_PORT=5432
ENV DATABASE_USR=rails_user

#This env. variables will be used by sunspot.yml to connect to Solr
ENV SOLR_HOST=192.168.0.20
ENV SOLR_PORT=8983

#This env. variables will be used by sunspot.yml to connect to Solr
ENV REDIS_HOST=192.168.0.20
ENV REDIS_PORT=6379

# You have to run this CMD with 0.0.0.0 IP address for port mapping to work in Docker container. Very strange.
CMD ["rails", "server", "-b", "0.0.0.0"]






