#!/bin/sh

# Start cron in the background
/usr/sbin/cron -f &

# Start Flask in the foreground
flask run