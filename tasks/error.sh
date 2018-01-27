#! /bin/bash

# Only allow to deploy one branch at a time
if
[ $cntBranch -gt 1 ] &&
[ $flagCreate = 1 ];
then
  echo "[ERROR] Multiple branch arguments - You can only deploy one branch at a time."
  exit
fi

# Only allow to deploy to one server at a time
if
[ $cntServer -gt 1 ] &&
[ $flagCreate = 1 ];
then
  echo "[ERROR] Multiple server arguments - You can only deploy to one server at a time."
  exit
fi
