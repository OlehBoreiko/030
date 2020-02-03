#!/bin/bash

#author: Oleh Boreiko

#SETUP CRON JOB
#####################################################################
#The below line should be added to crontab -e for running every week#
#0 0 * * 1 /bin/bash {path_to_the_script_location}/auto_update.sh   #
#####################################################################

#SETUP LOG ROTATION
################################################################################################################
#Extra task: configure log rotation to update-YYYYMMDD.log every month and keep the last 3 log files compressed#
# Create logrotate config file update-log in /etc/logrotate.d with the following content:                      #
#                                                                                                              #
#/var/log/update-*.log {                                                                                       #
#monthly                                                                                                       #
#rotate 3                                                                                                      #
#compress                                                                                                      #
#su root syslog                                                                                                #
#
################################################################################################################

# Get the current date
cur_date=`date +%Y%m%d`

#Run update and save the output into the log file
(sudo apt-get update -y && sudo apt-get upgrade -y) > /var/log/update-$cur_date.log
