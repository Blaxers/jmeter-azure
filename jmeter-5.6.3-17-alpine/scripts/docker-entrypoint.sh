#!/bin/bash
set -e

MODE=$1
shift

case "$MODE" in
  slave-mode)
    export _JAVA_OPTIONS="$*"

    echo "Starting JMeter slave server with mode: $MODE"
    echo "Using JVM options: $_JAVA_OPTIONS"

    $JMETER_HOME/bin/jmeter-server

    echo "----JMeter slave server successfully started---"
    echo "----JMeter Home ::: $JMETER_HOME ----"
    ;;
  *)
    echo "Sorry, provided mode '$MODE' is not supported. Only 'slave-mode' is supported."
    exit 1
    ;;
esac

exec "$@"