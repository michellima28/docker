# 01. On host, view all created network interfaces
# note: check docker0 and veth interfaces
sudo ip a

# 02. Check if there's any active container. If not, initiate one and catch IP its address
# note: observe that container IP address will be the same segment of Docker0 interface
sudo docker ps

sudo docker run -itd --name hands_busybox busybox

sudo docker inspect hands_busybox | grep IP

# 03. Access bash terminal in a container
sudo docker exec -it c2 bash

# 04. Check connectivity with "external world" pinging any internet host
ping 8.8.8.8

ping google.com

exit

# 05. Or directly, using command "docker exec"
sudo docker exec -it hands_busybox ping google.com

# 06. Create a container that supports web application with manual port mapping
# note: observe parameter "p"; after initiate container, check it in your browser localhost:9090
sudo docker run -itd --name web_80 -p 9090:80 httpd

# 07. Create a container that supports web application with automatic port mapping
# note: observe parameter "p"
sudo docker run -itd --name web_random -P httpd

# Automatic port mapping sets a random port, to find out, run:
# after find out port number, view the application in your browse: localhost:32769
sudo docker port web_random

# 08. Create a web container in host mode connection
# note: after creating it, check in your browse: http://localhost/
sudo docker run -itd --net host --name S1_host nginx

# 09. Create a MYSQL container
sudo docker run --name mysql --env MY_SQL_ROOT_PASSWORD=admin -d mysql

sudo docker run -it mysql bash

mysql -u root -p 
