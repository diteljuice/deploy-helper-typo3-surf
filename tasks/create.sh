#! /bin/bash

# Handle folder management
. './tasks/subtasks/folder-management.sh'

# Handle cronjob
if [ $flagIgnoreCronjob = 0 ];
then
  . './tasks/subtasks/cronjob.sh'
fi
