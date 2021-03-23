# 01. Create a container with "docker run" using image Ubuntu and install figlet package
sudo docker run -it ubuntu 
apt-get update && apt-get install figlet
exit

# 02. Inspect changes that has been made in container
sudo docker diff 33b1d10eb829 # container id

# 03. Commit changes in a new image
sudo docker commit 33b1d10eb829 figletimage
sudo docker images

# 04. Test created image
sudo docker run -it figletimage
figlet hello
