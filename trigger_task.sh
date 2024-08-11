#!/bin/sh

# URL of the Flask endpoint
URL="http://127.0.0.1:5000/task"

echo "$(date): Triggering $URL"

# Make the HTTP request using curl
# curl -X GET $URL

curl -X POST -H "Content-Type: application/json" -d '{"key":"runtask"}' $URL



# Optional: Log the response or any errors
if [ $? -eq 0 ]; then
    echo "$(date): Successfully triggered $URL" >> /usr/local/logfile.log
else
    echo "$(date): Failed to trigger $URL" >> /usr/local/logfile.log
fi