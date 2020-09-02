# start a container called ubuntu
sudo docker start ubuntu 

# stop a container called ubuntu
sudo docker stop ubuntu 

# pause a running container
sudo docker pause ubuntu

# check status
sudo docker ps 

# unpause a container
sudo docker unpause ubuntu

# remove a container
# note: you can just remove stopped containers
sudo docker rm ubuntu

# remove all inactive containers
sudo docker container prune

# remove all images that is not associated with another object
sudo docker image prune

# remove all images (included images associated with another object)
sudo docker image prune -a
