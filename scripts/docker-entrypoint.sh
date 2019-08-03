#!/bin/bash
set -e

if [[ "$1" = 'serve' ]];  then

  java -jar $JAVA_ARGS waterfall.jar
fi

exec "$@"
