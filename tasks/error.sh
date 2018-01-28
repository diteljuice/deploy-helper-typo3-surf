#! /bin/bash

# Errors for create action
if [ $flagCreate = 1 ];
then

  # Only allow to deploy one branch at a time
  if [ $cntBranch -gt 1 ];
  then
    echo "[ERROR] Multiple branch arguments - You can only deploy one branch at a time."
    exit
  fi

  # Do not allow --prune in "create" action
  if [ $flagPrune = 1 ];
  then
    echo "[ERROR] You can't use option --prune in action \"create\"."
    exit
  fi

fi

# Only allow to deploy to one server at a time
if
[ $cntServer -gt 1 ] &&
[ $flagCreate = 1 ];
then
  echo "[ERROR] Multiple server arguments - You can only deploy to one server at a time."
  exit
fi
