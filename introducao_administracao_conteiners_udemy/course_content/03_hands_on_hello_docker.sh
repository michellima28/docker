# 01. Download Debian official image
sudo docker pull debian 

# 02. Check all images on your local repository (pay attention to the fields: REPOSITORY, TAG and IMAGE ID)
sudo docker images 

# 03. Create a container from Debian image you've just downloaded
sudo docker run debian

# 04. List active containers on Docker Engine
sudo docker ps 

# 05. List ALL containers on Docker Engine (active and inactive)
sudo docker ps -a 

# 06. Create a container from Debian image and running bash command "cat /etc/issue.net" to catch Debian version
sudo docker run debian cat /etc/issue.net 

# 07. List ALL containers on Docker Engine (active and inactive)
sudo docker ps -a 

# 08. Create a container from Debian image with -itd and --name parameters, put your first name as container name
# -itd parameter will allow you to run container in background
sudo docker run -itd --name YOURNAME debian

# 09. List all active containers on Docker Engine, check NAME field
sudo docker ps

# 10. Create a new container from Ubuntu image and install nano editor on it
# note that is necessary to invoke bash to get access to container's shell 
sudo docker run -it ubuntu bash

sudo apt-get update && sudo apt-get install nano
