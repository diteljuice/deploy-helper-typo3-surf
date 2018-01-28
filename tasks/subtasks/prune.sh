#! /bin/bash

# Check for existing remote folders
REMOTE_FOLDERS=$(ssh $SSH_USER@$SSH_HOST \
"cd $DEPLOY_ROOT \
&& ls -d */" 2>&1)

for rf in ${REMOTE_FOLDERS}
do
  PRUNE_REMOTE+=( "${rf%/}" )
done

# Get remote branches and put them into an array
REMOTE_BRANCHES=($(git fetch && git branch -r | sed 's:.*/::'))

for rb in ${REMOTE_BRANCHES[@]}
do
  PRUNE_KEEP+=( "$rb" )
done

# Substract remote folders with remote branch names
for i in "${PRUNE_REMOTE[@]}"; do
     skip=
     for j in "${PRUNE_KEEP[@]}"; do
         [[ $i == $j ]] && { skip=1; break; }
     done
     [[ -n $skip ]] || PRUNE_DELETE+=(" $i ")
 done
declare PRUNE_DELETE
