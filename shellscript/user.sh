#!/bin/bash

# Check if the user provided a username
if [ -z "$1" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

USER=$1

# List processes for the given user
ps aux | awk -v user="$USER" '$1 == user {print}'
