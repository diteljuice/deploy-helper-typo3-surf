#! /bin/bash

# Check for errors
. "./tasks/error.sh"

# Iterate over each branch option and do subtasks
for b in ${BRANCH[@]}
do

  SELECTED_BRANCH=$b

  # Handle folder management
  . './tasks/subtasks/folder-management.sh'

  # Handle cronjob
  if [ $flagIgnoreCronjob = 0 ];
  then
    . './tasks/subtasks/cronjob.sh'
  fi
done
