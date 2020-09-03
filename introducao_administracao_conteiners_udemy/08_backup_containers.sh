# backup a container and compressing it in .gz
sudo docker export ubuntu | gzip > ubuntu_container.tar.gz

# list to see backup file
ls -l

# export 
du -sh ubuntu_container.tar.gz

# remove active container 
sudo docker rm -f ubuntu 

# check if it has been removed
sudo docker ps

# now, export container from localhost and import to a new image
zcat ubuntu_container.tar.gz | sudo docker import - import_new

# check if imported container is in images list 
sudo docker images

# running imported container
# note: to run imported containers you must explicit which command you want to use after container name, in this case, I will use bash
sudo docker run -itd --name imported_container import_new bash

# check if it is active 
sudo docker ps 

# check file content that I created before
sudo docker exec imported_container cat /tmp/my_file

# backup an image and compressing it in .gz
sudo docker save import_new | gzip -c > ubuntu_image.tar.gz

# checking files size: backed up container and images
du -sh ubuntu_image.tar.gz
du -sh ubuntu_container.tar.gz

# stopping imported_container
sudo docker stop imported_container

# remove container and image 
sudo docker rm imported_container
sudo docker rmi import_new

# load backup image 
sudo docker load < ubuntu_image.tar.gz

# check all images 
sudo docker images
