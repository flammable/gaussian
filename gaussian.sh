#!/bin/bash

echo="/bin/echo"
mkdir="/bin/mkdir"
chown="/usr/sbin/chown"
chmod="/bin/chmod"

CURRENTUSER=$(who | awk '/console/ {print $1}' | awk '!/_mbsetupuser/')

# create the caches directory and set appropriate permissions
${mkdir} -p ${HOME}/Library/Caches/gaussian
${chown} -R ${CURRENTUSER}:gaussian ${HOME}/Library/Caches/gaussian/
${chmod} -R 770 ${HOME}/Library/Caches/gaussian/

# the tcsh stuff
${echo} "setenv g09root /Applications" >> ${HOME}/.login
${echo} "source \$g09root/g09/bsd/g09.login" >> ${HOME}/.login

# set the caches directory for tcsh
${echo} "setenv GAUSS_SCRDIR ${HOME}/Library/Caches/gaussian" >> ${HOME}/.login

# the bash stuff
${echo} "g09root=/Applications" >> ${HOME}/.profile
${echo} "export g09root" >> ${HOME}/.profile
${echo} ". \$g09root/g09/bsd/g09.profile" >> ${HOME}/.profile

# set the caches directory for bash
${echo} "GAUSS_SCRDIR=${HOME}/Library/Caches/gaussian" >> ${HOME}/.profile
${echo} "export GAUSS_SCDIR" >> ${HOME}/.profile

exit
