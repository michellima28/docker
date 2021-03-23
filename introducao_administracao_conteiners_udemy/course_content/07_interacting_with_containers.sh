# attach command: used to go back to container
# example
# note: it doesn't work in a stopped container
sudo docker attach ubuntu

# starting container again (in background)
sudo docker run -itd --name ubuntu ubuntu:18.04

# check active containers
sudo docker ps

# execute ls command in ubuntu container
sudo docker exec ubuntu ls

# execute ps aux command in ubuntu container
sudo docker exec ubuntu ps aux

# creating a file inside container
sudo docker exec -d ubuntu touch /tmp/my_file

# listing files in target directory
sudo docker exec ubuntu ls /tmp/

# interacting: writting something in a file inside a container 
sudo docker exec ubuntu bash -c "echo 'learning_docker' >> /tmp/my_file"

# check if it has been written
sudo docker exec ubuntu cat /tmp/my_file

# interacting with -it parameter
sudo docker exec -it ubuntu bash

# copying a file from container to localhost, to working directory
sudo docker cp ubuntu:/tmp/my_file .

# remove file on localhost
sudo rm my_file
