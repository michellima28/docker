# 01. Which commands you used to create and list shared volume?
sudo docker volume create web_volume

sudo docker volume ls

# 02. Which commands you used to create the three web containers, with background execution and access
# the shared volume previously created?
sudo docker run -d --name web1 -p 180:80 -v web_volume:/usr/local/apache2/htdocs httpd:2.4

sudo docker run -d --name web2 -p 181:80 -v web_volume:/usr/local/apache2/htdocs httpd:2.4

sudo docker run -d --name web3 -p 182:80 -v web_volume:/usr/local/apache2/htdocs httpd:2.4

sudo docker ps

# 03. As long as you have downloaded Front files, which command you used to send this file to volume?
cd ~/Downloads
unzip startbootstrap-stylish-portfolio-gh-pages.zip
sudo docker cp startbootstrap-stylish-portfolio-gh-pages/. web1:/usr/local/apache2/htdocs

# 04. You need to create a backup now. So, create a temporary container (--rm option), busybox image, 
# responsible for mapping shared volume and directory in backup partition on host, and execute inside
# container a command to generate backup file into backup partition.

sudo docker run --rm -v /mnt/docker/backup:/tmp/ -v web_volume:/root busybox tar cvf /tmp/backup.tar /root

ls /mnt/docker/backup/

# 05. Send printscreen when you access via browser in distinct ports (80, 81, 82)
http://localhost:180/

http://localhost:181/

http://localhost:182/
