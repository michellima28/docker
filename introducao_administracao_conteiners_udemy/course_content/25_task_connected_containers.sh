# 01. What command is used to create user defined bridge network named "lb-web"?
sudo docker network create lb-web
sudo docker network ls

# 02. Which commands are used to create volumes vol-web1 and vol-web2; and containers, in background, 
# web1 and web2, inside bridge network created?
sudo docker volume create vol-web1
sudo docker volume create vol-web2
sudo docker volume ls
sudo docker run -itd --name web1 -v vol-web1:/usr/local/apache2/htdocs --net lb-web httpd
sudo docker run -itd --name web2 -v vol-web2:/usr/local/apache2/htdocs --net lb-web httpd
sudo docker ps

# 03. Which commands are used to sent files, attached in Udemy course platform, website FRONT
# to containers web1 and web2?
sudo docker cp /home/michel/docker/FRONT_web1/. web1:/usr/local/apache2/htdocs
sudo docker cp /home/michel/docker/FRONT_web2/. web2:/usr/local/apache2/htdocs

# 04. What command used to create and initialize balance container named "lb",
# in port 83, inside created network and mapping config directoty /usr/local/etc/haproxy?
sudo docker run -itd --name lb -p 8083:80 --net lb-web -v /home/michel/docker:/usr/local/etc/haproxy haproxy:1.6

# Send a printscreen of web access web for each response, container web1 and container web2
localhost8083
