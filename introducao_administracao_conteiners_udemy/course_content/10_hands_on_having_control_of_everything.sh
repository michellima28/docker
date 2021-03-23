# 01. List all containers on Docker Engine
sudo docker ps -a

# 02. Stop all containers (active and inactive)
sudo docker stop $(sudo docker ps -q)

# 03. Initiate any container in background
# note: if there's no container, create one executing: "sudo docker run -itd --name YOURNAME ubuntu"
sudo docker run -itd --name hands_on ubuntu

# 04. Create a file in named container
sudo docker exec -d hands_on  touch /tmp/maonamassa

sudo docker exec -d hands_on  bash -c "echo 'maonamassa' >> /tmp/maonamassa"

sudo docker exec -it hands_on  bash

cd /tmp && cat maonamassa

exit

# 05. Create a txt file on host and send it to container
sudo touch arquivo.txt

sudo echo "arquivo de teste" >> arquivo.txt

sudo docker cp arquivo.txt hands_on:/tmp

# 06. Make modifications in container file and sent it to host again
sudo docker attach hands_on

echo "dentro do container" >> /tmp/arquivo.txt

CTRL+P+Q

sudo docker cp hands_on:/tmp/arquivo.txt $(pwd)

# 07. Stop container
sudo docker stop hands_on

# 08. Find out which image this container is associated with and then, remove it
sudo docker inspect hands_on | grep Image

sudo docker rm hands_on

sudo docker rmi ubuntu

# 09. Remove all containers and images
sudo docker container prune

sudo docker image prune -a

# 10. Search for an image in Docker Hub called "alpine"
sudo docker search --filter "is-official=true" --filter "stars=100" --no-trunc alpine

# 11. Create a container in background from Alpine image and download throghut container Debian ISO. After doing this, monitor logs
# note: at the end of the process container will be removed due to --rm parameter
sudo docker run -itd --rm --name wget alpine wget -c http://debian.c3sl.ufpr.br/debian-cd/9.8.0/amd64/iso-cd/debian-9.8.0-amd64-netinst.iso

sudo docker logs -f wget
