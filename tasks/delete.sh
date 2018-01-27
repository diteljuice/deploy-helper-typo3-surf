#! /bin/bash

# Check for errors
. "./tasks/error.sh"

for s in ${SERVERS[@]}
do

  . "./config/server/$s.cfg"

  # Iterate over each branch option and do subtasks
  for b in ${BRANCHES[@]}
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

done
