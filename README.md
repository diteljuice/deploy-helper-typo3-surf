# Helper shell script for deployment with TYPO3 Surf

## Configure

Server configuration is located in the folder config/server.

**DEPLOY_ROOT**
The absolute path on the server, where the branch-folders should be located in.

**SHELL_ROOT**
The absolute path on the server, where the global shell script, containing the references to the cli_dispatch.phpsh file, is located.

**SHELL_FILENAME**
The filename of the global shell script

**CJ_EXEC_FILE**
Absolut path to the TYPO3 cli_dispatch.phpsh file that shall be executed.

**CJ_PRE_PATH**
Custom prefix of the path. To execute the cli_dispatch.phpsh file, you might need different commands, depending on the server. For example `php` others need `env`.

**CJ_POST_PATH**
Is optinal. Custom appendix to the cli_dispatch.phpsh. For example `scheduler`.

## How to use

### Run script

**Create folder + cronjob entry:**

`./deployment-helper.sh -b=feature-branch-123 -s=staging -c`

or

`./deployment-helper.sh --branch=feature-branch-123 --server=staging --create`

**Create folder + skip cronjob entry:**

`./deployment-helper.sh -b=feature-branch-123 -s=staging -icj -c`

or

`./deployment-helper.sh --branch=feature-branch-123 --server=staging --ignore-cronjob --create`

**Delete folder:**

`./deployment-helper.sh -b=feature-branch-123 -s=staging -d`

`./deployment-helper.sh --branch=feature-branch-123 --server=staging --delete`

It is possible to delete multiple branches at a time

`./deployment-helper.sh -b=feature-branch-123 -b=feature-branch-456 -s=staging -d`

`./deployment-helper.sh --branch=feature-branch-123 --branch=feature-branch-456 --server=staging --delete`

### Add server configuration

### Options

`-b=` or `--branch=`: Branch name to deploy

`-s=` or `--server=`: Server to deploy to

`-icj` or `--ignore-cronjob`: Ignore creation of shell file and adding/removing cronmjob entries

`-c` or `--create`: Create folder and cronjob entry

`-d` or `--delete`: Deletes folder and cronjob entry

`--help`: Get some help on the bash (NOT IMPLEMENTED YET)

## To Do

* Write README instructions
* Write --help text
* Delete on multiple servers
