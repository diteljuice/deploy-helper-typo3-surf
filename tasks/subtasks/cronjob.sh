#! /bin/bash

# If deployment shall create
if [ $flagCreate = 1 ];
then
  ssh $SSH_USER@$SSH_HOST \
  "[ ! -f '$SHELL_ROOT/$SHELL_FILENAME' ] \
  && echo '#! /bin/bash' >> $SHELL_ROOT/$SHELL_FILENAME \
  && chmod 755 $SHELL_ROOT/$SHELL_FILENAME \
  && echo '$CJ_PRE_PATH $DEPLOY_ROOT/$BRANCH/$CJ_EXEC_FILE $CJ_POST_PATH' >> $SHELL_ROOT/$SHELL_FILENAME \
  || echo '$CJ_PRE_PATH $DEPLOY_ROOT/$BRANCH/$CJ_EXEC_FILE $CJ_POST_PATH' >> $SHELL_ROOT/$SHELL_FILENAME \
  && exit"
fi

# If deployment shall delete
if [ $flagDelete = 1 ];
then
  ssh $SSH_USER@$SSH_HOST \
  "[ -f '$SHELL_ROOT/$SHELL_FILENAME' ] \
  && sed -i '/$BRANCH/d' $SHELL_ROOT/$SHELL_FILENAME \
  && exit"
fi
