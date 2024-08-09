FROM alpine:latest

# Install curl
# RUN apk add --no-cache curl

# Copy Scripts to Docker Image
COPY echo_task.sh /usr/local/bin/echo_task.sh

RUN touch /usr/local/logfile.log
RUN chmod +x /usr/local/bin/echo_task.sh
# Add the cron job - min, hour, day, month, year
RUN echo '*  *  *  *  * /usr/local/bin/echo_task.sh' >> /etc/crontabs/root

# Run crond  -f for Foreground 
CMD ["/usr/sbin/crond", "-f"]