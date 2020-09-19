 # catch docker info
 sudo docker info

# download ubuntu 16.04 image
sudo docker pull ubuntu:16.04

# docker info files
sudo ls /var/lib/docker

sudo du -sh /var/lib/docker/overlay2

# docker images saved in host
sudo docker images

# runnning a container in background
sudo docker run -itd --name mycontainer ubuntu:16.04

# check active containers
sudo docker ps

# container's size in disk
sudo docker ps -s

# creating a text file inside mycontainer
sudo docker exec -it mycontainer touch /tmp/test

sudo docker exec -it mycontainer bash

echo "my container" >> /tmp/test
exit

# checking container size again
sudo docker ps -s

# docker's container folder
sudo du -sh /var/lib/docker/containers/

# docker's storage folder
sudo du -sh /var/lib/docker/overlay2/
