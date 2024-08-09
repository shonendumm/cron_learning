# Start Dockerfile
1. Build the docker image
`docker build -t <image-tag> .`

2. List docker images
`docker image ls`

3. Run the docker container
`docker run -d -p 8000:8000 my-image-name`

4. Verify that container is running
`docker ps`

5. Access the container's shell
`docker exec -it <container_id_or_name> /bin/sh`
