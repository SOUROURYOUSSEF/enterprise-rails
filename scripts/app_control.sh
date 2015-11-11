#!/usr/bin/env bash

if [ "$RAILS_HOME"  == "" ]; then
    echo "You must set RAILS_HOME env variable before running this script."
    exit 1
fi

bin=`readlink "$0"`
if [ "$bin" == "" ]; then
 bin=$0
fi
bin=`dirname "$bin"`
bin=`cd "$bin"; pwd`

echo $bin

command=$1
shift

services=(${@})

function start () {
  EXIT_STATUS=0
  pushd $RAILS_HOME > /dev/null

    #if should_handle postgres;  then
    #  $bin/start_postgres.sh;
    #  EXIT_STATUS=`expr $EXIT_STATUS + $?`;
    #fi

    if should_handle solr; then
       $bin/start_solr.sh;
       EXIT_STATUS=`expr $EXIT_STATUS + $?`;
    fi

    if should_handle rails; then
       $bin/start_rails.sh;
       EXIT_STATUS=`expr $EXIT_STATUS + $?`;
    fi
}

function stop () {
  while getopts "t:" OPTION; do
       case $OPTION in
           t)
               MAX_WAIT_TIME=$OPTARG
               ;;
       esac
  done
  shift $(( OPTIND - 1 ))
  services=(${@})

  EXIT_STATUS=0
  pushd $CHORUS_HOME > /dev/null
  if should_handle rails;  then
    $bin/stop_rails.sh  $MAX_WAIT_TIME;
    EXIT_STATUS=`expr $EXIT_STATUS + $?`;
  fi
  if should_handle scheduler;  then
    $bin/stop-scheduler.sh  $MAX_WAIT_TIME;
    EXIT_STATUS=`expr $EXIT_STATUS + $?`;
  fi
  if should_handle workers;    then
    $bin/stop-workers.sh $MAX_WAIT_TIME

    EXIT_STATUS=`expr $EXIT_STATUS + $?`;
  fi
  if should_handle indexer;    then
    $bin/stop-indexer.sh $MAX_WAIT_TIME
    EXIT_STATUS=`expr $EXIT_STATUS + $?`;
  fi
  if should_handle solr;       then
    $bin/stop_solr.sh  $MAX_WAIT_TIME;
    EXIT_STATUS=`expr $EXIT_STATUS + $?`;
  fi
  if should_handle postgres;   then
    $bin/stop-postgres.sh  $MAX_WAIT_TIME;
    EXIT_STATUS=`expr $EXIT_STATUS + $?`;
  fi
  popd > /dev/null
  if (($EXIT_STATUS > 0)); then
    exit $EXIT_STATUS;
  fi
}

  # check to see if script is programmed to manage a service or a process
  function should_handle () {
    # If no services are provided, or $1 is a service to start
    [ ${#services[@]} -eq 0 ] || contains ${services[@]} $1
  }

  function contains() {
      local n=$#
      local value=${!n}
      for ((i=1;i < $#;i++)) {
          if [ "${!i}" == "${value}" ]; then
              return 0
          fi
      }
      return 1
  }

case $command in
    start )
        start
        ;;
    stop )
        stop ${@}
        ;;
    restart )
        stop ${@}
        start
        ;;
    monitor )
       monitor
       ;;
    backup )
       backup ${@}
       ;;
    restore )
       restore ${@}
       ;;
	setup )
	   setup ${@}
	   ;;
	health_check )
	   health_check ${@}
	   ;;
	configure )
	   configure ${@}
	   ;;
	migrate )
	   migrate ${@}
	   ;;
    * )
       usage
       ;;
esac

exit 0
