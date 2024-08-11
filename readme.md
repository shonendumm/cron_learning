# Start Dockerfile
1. Build the docker image
`docker build -t trigger_task .`

2. List docker images
`docker image ls`

3. Run the docker container
`docker run -d -p 5000:5000 trigger_task`

4. Verify that container is running
`docker ps`

5. Access the container's shell
`docker exec -it <container_id_or_name> /bin/sh`


# System-wide cron jobs added by the Dockerfile
1. List the cron jobs 
ls /etc/cron.d/

2. View the cron jobs text
cat /etc/cron.d/[cron_file]



# User-based cron jobs

1. View the existing cron jobs
crontab -l

2. Edit the cron jobs 
crontab -e



