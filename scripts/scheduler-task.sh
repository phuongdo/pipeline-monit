#!/usr/bin/env bash

# pid=2018-11-20 ( A(run|done)--> B(run|done) --> C(run|done))
# sh bin/sheduler-task  A http://localhost:10001 "sh bin/app.sh arg1 arg2 arg3"

function start_task {
    local pipeline_name="$1"
    local process_name="$2"
    local service_address="$3"
    local run_command="$4"

    local pipeline_status=$(curl -sSl -X GET ${service_address}/pipeline/${pipeline_name}/status)

    if [[ ${pipeline_status} == 'RUNNING' ]]
    then
       #echo 'Pipeline is running, select the current pipeline job...'

       local current_job_id=$(curl -sSL -X GET ${service_address}/pipeline/${pipeline_name}/currentJob)

       if [[ "${process_name}" == "${current_job_id}" ]]
       then
            echo 'Starting job '${current_job_id}
            # your command here

            bash -c "$(printf 'bash -c %q' "${run_command}")"

            echo 'Job '${current_job_id}' finished'
            # call to service
            curl -X GET -s ${service_address}/pipeline/${pipeline_name}/update/${current_job_id}/done
       fi
    fi
}

export -f start_task

start_task "$1" "$2" "$3"