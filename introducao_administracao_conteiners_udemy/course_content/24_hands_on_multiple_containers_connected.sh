# 01. Create an Ubuntu container with name ubuntu1
sudo docker run -itd --name ubuntu1 ubuntu:18.04

# 02. Create a second container linking with the first one
sudo docker run -itd --name ubuntu2 --link ubuntu1:cont1 ubuntu:18.04

# 03. Access second container's terminal
sudo docker exec -it ubuntu2 bash

apt-get update && apt-get install -y iputils-ping
ping cont1

sudo docker exec -it ubuntu1 bash

apt-get update && apt-get install -y iputils-ping
ping ubuntu2

# 04. Check hosts files of the source container (ubuntu2)
# Note: the result will show ubuntu1's ip associated with the alias "cont1"
sudo docker exec ubuntu2 cat /etc/hosts

# 05. Create your "own" bridge network
# Note: you can add all containers will want to make connections
sudo docker network create minharede

# 06. Visualize network creation
# Note: ls command show all existing networks and inspect command show network details
sudo docker network ls

sudo docker network inspect minharede

# 07. Create two containers with Debian image and add them to the same network (minharede)
sudo docker run -itd --name debian1 --net minharede debian

sudo docker run -itd --name debian2 --net minharede debian

# 08. Access ubuntu1 container and test if it has connection with debian1
# Note: there's no connection with debian1 because it's not associated in the recently created network
docker exec -it ubuntu1 bash

ping debian2

exit 

# 09. Access debian1 container and test if it has connection with debian2
# Note: connection will be established successfully because this container is part of network created
sudo docker exec -it debian1 bash

ping debian2

exit

# 10. Remove network and containers created
sudo docker stop ubuntu1
sudo docker stop ubuntu2
sudo docker stop debian1
sudo docker stop debian2
sudo docker rm ubuntu1
sudo docker rm ubuntu2
sudo docker network rm minharede
