#!/usr/bin/env bash

# sh bin/scheduler-init.sh demography-pred-raw 2018-11-20 'A>B>C' http://localhost:10001
#
PNAME=$1
PID=$2
BODY_DATA=$3
END_POINT=$4

PIPELINE_STATUS=$(curl -X GET -s $END_POINT/pipeline/$PNAME/status)
if [ $PIPELINE_STATUS == 'null' ]
then
   echo 'Pipeline init...'
   curl -X POST -s -H "Content-Type: application/json" -d $BODY_DATA $END_POINT/pipeline/$PNAME/create/$PID
fi
