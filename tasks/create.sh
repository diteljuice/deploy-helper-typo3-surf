#! /bin/bash

# Check for errors
. "./tasks/error.sh"

SELECTED_BRANCH=${BRANCHES[0]}

# Handle folder management
. './tasks/subtasks/folder-management.sh'

# Handle cronjob
if [ $flagIgnoreCronjob = 0 ];
then
  . './tasks/subtasks/cronjob.sh'
fi
