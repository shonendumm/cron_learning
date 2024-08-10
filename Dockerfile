FROM python:3.9-slim

########### For Flask App ###########
# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

########### For Cron job ###########
# Install cron and other necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    cron \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Copy scripts to Docker image
COPY trigger_task.sh /usr/local/bin/trigger_task.sh
COPY echo_task.sh /usr/local/bin/echo_task.sh

RUN touch /usr/local/logfile.log

# Make scripts executable
RUN chmod +x /usr/local/bin/trigger_task.sh
RUN chmod +x /usr/local/bin/echo_task.sh


# Create the crontab files and add the cron jobs
# need to specify the user as root, for jobs in /etc/cron.d to run
RUN echo '* * * * * root /bin/sh /usr/local/bin/trigger_task.sh' > /etc/cron.d/trigger-task
RUN echo '* * * * * root /bin/sh /usr/local/bin/echo_task.sh' > /etc/cron.d/echo-task

# Set appropriate permissions for the cron job file
# RUN chmod 0644 /etc/cron.d/echo-task


############# For running both Flask and Cron #############
# Start cron in the foreground 
CMD ["/bin/sh", "-c", "/usr/sbin/cron -f & flask run"]