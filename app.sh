#!/bin/bash
flag=${1:-start}
project=${2}

compose="/docker-compose.yml"

RED='\033[0;31m'
GREEN='\33[1;32m'
BLUE='\33[1;30m'
NC='\033[0m'

source workspace/.bash/new.sh
source workspace/.bash/stop.sh
source workspace/.bash/start.sh

if [ "$flag" == "new" ]; then
    new $project
elif [ "$flag" == "stop" ]; then
    stop $project
elif [ "$flag" == "start" ]; then
    start $project
fi
