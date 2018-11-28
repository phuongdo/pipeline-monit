#!/usr/bin/env bash

# sh bin/scheduler-init.sh 2018-11-20 'A>B>C' http://localhost:10001
#

PID=$1
BODY_DATA=$2
END_POINT=$3

PIPELINE_STATUS=$(curl -X GET -s $END_POINT/pipeline/status)
if [ $PIPELINE_STATUS == 'null' ]
then
   echo 'Pipeline init...'
   curl -X POST -s -H "Content-Type: application/json" -d $BODY_DATA $END_POINT/pipeline/create/$PID
fi
