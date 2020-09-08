# running containers with no bridges between host and container
# note: other container features still keep isolated

# inspect host
sudo docker inspect host

# creating two containers in host mode
sudo docker run -itd --net host --name c1_busybox busybox

sudo docker run -d --net host --name c2_httpd httpd

# view active containers
sudo docker ps

# checking host network information inside c1_busybox container
sudo docker exec c1_busybox ip a

# inspect c2_httpd IPs
# note: there's no IP information because it was created in host mode
sudo docker inspect c2_httpd | grep IP

# ATTENTION: if another container runs in host mode in the same socket (80), its gonna get an error!
sudo docker run -d --net host nginx

sudo docker ps -a

sudo docker logs 91b5
