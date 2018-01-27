#! /bin/bash

#load basic config
. './config/global.cfg'

if [ $# = 0 ];
then
  printf "You are missing arguments. Use like:\n"
  printf "=> ./deployment-helper.sh -b=branch-name -s=staging -c OR deployment --branch=branch-name --server=staging --create \n"
  printf "=> ./deployment-helper.sh -b=branch-name -s=staging -d OR deployment --branch=branch-name --server=staging --delete\n"
  printf "Get more help by using arugment --help:\n"
  printf "=> ./deployment-helper.sh --help"
fi

while [[ $# -gt 0 ]]
do
	key="$1"

  case $key in
		-b=*|--branch=*)
      for b in ${key#*=}
      do
        let cntBranch++
      done
      BRANCH+=(${key#*=})
      shift
  		;;
    -s=*|--server=*)
      for b in ${key#*=}
      do
        let cntServer++
      done
      . "./config/server/${key#*=}.cfg"
      shift
      ;;
    -icj|--ignore-cronjob)
      flagIgnoreCronjob=1
      shift
      ;;
    -c|--create)
      flagCreate=1
      . './tasks/create.sh'
      shift
  		;;
    -d|--delete)
      flagDelete=1
  		. './tasks/delete.sh'
      shift
  		;;
    --help)
      . './tasks/help.sh'
      exit 1
  		;;
    \?)
      echo "Unknown option: -$OPTARG" >&2;
      exit 1
      ;;
    :)
      echo "Missing option argument for -$OPTARG" >&2;
      exit 1
      ;;
  	*)
  		echo "Unimplemented option: -$OPTARG" >&2;
  		exit 1
  		;;
  esac
done

echo "--- Script done ---"

exit
