#!/usr/bin/env bash

#sh bin/demo.sh 1000 localhost:1800  "sh bin/app.sh 'hello 1' 3"

#echo "params only 2    : ${@:2:1}"
#echo "params 2 and 3   : ${@:2:2}"
echo "params all from 2: ${@:3:1}"

#sh bin/demo.sh 1000 localhost:1800  "sh bin/app.sh 'hello 1' 3"

echo $1
echo $2

bash -c "$(printf 'bash -c %q' "${@:3:1}")"

#CMD="${@}"
#echo $CMD
#$CMD
