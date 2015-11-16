CLOCKWORK_HOME=$RAILS_HOME/components/jobs
echo "Starting Clockwork"
cd $CLOCKWORK_HOME
echo $PWD
CLOCKWORK_PID_FILE=$RAILS_HOME/tmp/pids/clockwork.pid
bundle exec clockwork $CLOCKWORK_HOME/lib/clock.rb >> $RAILS_HOME/log/clockwork.log 2>&1 &
clockwork_pid=$!
echo $clockwork_pid > $CLOCKWORK_PID_FILE
echo "Clockwork started as pid $clockwork_pid"
