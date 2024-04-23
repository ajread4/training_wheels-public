#!/bin/bash
# @Author: John Hammond
# @Date:   2016-08-28 15:08:22
# @Last Modified by:   AJ Read
# @Last Modified time: 2024-04-22


# Colors for good display...
BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 6`
RESET=`tput sgr0`


DEPENDENCIES="colorama" # updated to cover new dependencies 

function install_dependencies(){

	echo "${FUNCNAME}:${GREEN} installing colorama..${RESET}"

	apt-get -y install $DEPENDENCIES || fatal_error
}

function fatal_error(){

	echo "${FUNCNAME}:${RED} aborting...${RESET}"
	exit -1
}

function main(){

	echo "${BLUE} This script will install the dependencies that you should have as a user"

	install_dependencies

}

if [ "$UID" != "0" ]
then
	echo "You must be root to run this script!"
	fatal_error
fi


main $@