#! /bin/bash

# Create folder
if [ $flagCreate = 1 ];
then
  ssh $SSH_USER@$SSH_HOST \
  "[ ! -d '$DEPLOY_ROOT/$BRANCH' ] \
  && mkdir $DEPLOY_ROOT/$BRANCH  \
  && exit"
fi

# Delete folder

if [ $flagDelete = 1 ];
then
  ssh $SSH_USER@$SSH_HOST \
  "[ -d '$DEPLOY_ROOT/$BRANCH' ] \
  && rm -rf $DEPLOY_ROOT/$BRANCH  \
  && exit"
fi
