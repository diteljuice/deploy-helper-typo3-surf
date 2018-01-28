#! /bin/bash

# Check for errors
. "./tasks/error.sh"

# Do delete subtask on server(s)
for s in ${SERVERS[@]}
do
  . "./config/server/$s.cfg"

  if [ $flagPrune = 1 ];
  then
    . "./tasks/subtasks/prune.sh"
    BRANCHES=("${PRUNE_DELETE[@]}")
  fi

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
