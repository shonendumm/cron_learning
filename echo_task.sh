#!/bin/bash

# Use the POSIX-compliant way to source a file
# https://stackoverflow.com/questions/192292/bash-how-best-to-include-other-scripts
# . /etc/environment

echo "$(date): This is the echo task" >> /usr/local/logfile.log
echo "The value of KEY is $KEY" >> /usr/local/logfile.log