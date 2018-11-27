#!/usr/bin/env bash

# pid=2018-11-20 ( A(run|done)--> B(run|done) --> C(run|done))
# sh bin/sheduler-task A http://localhost:10001 "sh bin/app.sh arg1 arg2 arg3"

NAME_SERVICE=$1
END_POINT=$2
CMD=$3

 ### for loop all service ###
for (( ; ; ))
do
   echo "Pres CTRL+C to stop..."

   PIPELINE_STATUS=$(curl -X GET $END_POINT/pipeline/status)

   if [ $PIPELINE_STATUS == 'RUNNING' ]
   then
       echo 'Pipeline is running, select the current pipeline job...'

       CURRENT_JOB_ID=$(curl -X GET $END_POINT/pipeline/currentJob)

       if [ $NAME_SERVICE == $CURRENT_JOB_ID ]
       then
            echo 'Starting job '$CURRENT_JOB_ID
            # your command here

            # bin/java.sh prod PushDataToClickHouseDB '$PID'
            bash -c "$(printf 'bash -c %q' "${@:3:1}")"

            echo 'Job '$CURRENT_JOB_ID' finished'
            # call to service
            curl -X GET $END_POINT/pipeline/update/$CURRENT_JOB_ID/done
       fi
   fi

   sleep 5m

done
