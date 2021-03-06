#!/usr/bin/env bash

# pid=2018-11-20 ( A(run|done)--> B(run|done) --> C(run|done))
PNAME=$1
NAME_SERVICE=$2
END_POINT=$3

 ### for loop all service ###
for (( ; ; ))
do
   echo "Pres CTRL+C to stop..."
   # get PIPELINE_ID, here is the event-date of data processing
   PIPELINE_ID=$(curl -X GET $END_POINT/pipeline/$PNAME/id)
   if [ $PIPELINE_ID != 'null' ]
   then
   	   echo 'run on date '$PIPELINE_ID
 	   curl -sSL  https://raw.githubusercontent.com/phuongdo/pipeline-monit/master/scripts/scheduler-task.sh | bash -s $PNAME $NAME_SERVICE $END_POINT "sh bin/app.sh $PIPELINE_ID arg2 arg3"  
   fi

   sleep 5m

done
