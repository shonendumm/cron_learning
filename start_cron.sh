#!/bin/bash

# Define the cron job
# every 1 minutes, every hour, every day, every month, every day of the week
cron_job="*/1 * * * * trigger_task.sh"

# Check if the cron job already exists, else add it
(crontab -l | grep -F "$cron_job") || (crontab -l; echo "$cron_job") | crontab -

# Check if the cron job was added successfully
if [ $? -eq 0 ]; then
    echo "$(date): Successfully added the cron job"
    echo "$(date): Successfully added the cron job" >> logfile.log
    service cron restart
else
    echo "$(date): Failed to add the cron job" >> logfile.log
fi