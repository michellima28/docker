# inspect - render all container information in json output
# inspect ubuntu container
sudo docker inspect ubuntu

# filtering elements
sudo docker inspect ubuntu | grep Image

# filtering using --format
sudo docker inspect --format='{{.Config.Image}}' ubuntu

# creating a sample container, running it in background and run a ping command
sudo docker run --name LOGS -d busybox ping 127.0.0.1 -c 20

# check if container is active and running
sudo docker ps

# view logs output
sudo docker logs LOGS

# removing container called LOGS
sudo docker rm LOGS

# creating a sample container, running it in background and run a ping command
sudo docker run --name LOGS -d busybox ping 127.0.0.1 -c 50

# view logs in an interactive way
sudo docker logs -f LOGS

# creating a sample container again
sudo docker rm LOGS 
sudo docker run --name LOGS -d busybox ping 127.0.0.1 -c 50

# show statistics
sudo docker stats 

# docker architecture information
sudo docker info

# docker version
sudo docker version
