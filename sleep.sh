#!/usr/bin/env bash

print_usage () {
  echo "usage: ${0} [minutes to wait before sleep]"
}

# Read the number of minutes from the command line.
MINUTES=${1}
# If minutes wasn't provided then ask the user.
if [ -z "${MINUTES}" ];  then
  read -rp "How many minutes before going to sleep? " MINUTES
fi

# Validate the input is a valid integer.
re='^[0-9]+$'
if ! [[ $MINUTES =~ $re ]] ; then
   echo "error: ${MINUTES} is not a number" >&2
   print_usage
   exit 1
fi

SECONDS=$(( MINUTES * 60 ))

echo "waiting ${MINUTES} minutes before going to sleep"

sleep $SECONDS

# Put the computer to sleep.
pmset sleepnow
