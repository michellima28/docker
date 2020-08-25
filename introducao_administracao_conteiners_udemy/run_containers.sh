# run hello-world image
sudo docker run hello-world

# run ubuntu 18.04 image
sudo docker run ubuntu:18.04

# showing active containers
sudo docker ps

# showing all containers
sudo docker ps -a

# running container with interaction from terminal
sudo docker run --rm -it ubuntu:20.04

# running container with interaction, creating a name and setting to run it in background
sudo docker run --name ubuntu -itd ubuntu:20.04

# check if container is active
sudo docker ps

# downloading a new image called busybox, running a new container and executing ping command
sudo docker run --name ping -d busybox ping 127.0.0.1 -c 15
