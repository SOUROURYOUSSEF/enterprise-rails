SIDEKIQ_HOME=$RAILS_HOME/components/jobs
echo "Starting Sideqik"
cd $RAILS_HOME
echo $PWD

bundle exec sidekiq  -d -C $RAILS_HOME/components/jobs/config/sidekiq.yml -P $RAILS_HOME/tmp/pids/sidekiq.pid  -L $RAILS_HOME/log/sidekiq.log -e $RAILS_ENV
