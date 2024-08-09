FROM alpine:latest

# Install curl
# RUN apk add --no-cache curl


# Copy scripts to Docker image
COPY echo_task.sh /usr/local/bin/echo_task.sh

# Create a log file [optional]
RUN touch /usr/local/logfile.log

# Make the script executable
RUN chmod +x /usr/local/bin/echo_task.sh
# Add the cron job - min, hour, day, month, year
RUN echo '*  *  *  *  * /usr/local/bin/echo_task.sh' >> /etc/crontabs/root

# Run crond  -f for Foreground 
CMD ["/usr/sbin/crond", "-f"]