#!/bin/bash

# URL of the Flask endpoint
URL="http://127.0.0.1:5000/task"

echo "$(date): Triggering $URL"

# Make the HTTP request using curl
curl -X GET $URL

# Optional: Log the response or any errors
if [ $? -eq 0 ]; then
    echo "$(date): Successfully triggered $URL" >> logfile.log
else
    echo "$(date): Failed to trigger $URL" >> logfile.log
fi