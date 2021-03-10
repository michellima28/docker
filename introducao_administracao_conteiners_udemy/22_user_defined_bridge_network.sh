# creating a network bridge
sudo docker network create --subnet 10.0.0.0/24 busybox-net

# listing all docker networks
sudo docker network ls

# checking ip a
ip a

# show network configurations of bridge network recently created
sudo docker network inspect busybox-net

# creating a container in background and assign it to the network recently created
# adding --net parameter
sudo docker run -itd --name c1 --net busybox-net busybox

# check if container is running
sudo docker ps

# creating another container and setting manually ip address and port
sudo docker run -itd --name c2 --net busybox-net --ip 10.0.0.254 -p 9090:80 nginx

# showing communications between them. Ping c2 ip from c1 
sudo docker exec -it c1 ping 10.0.0.254

# Now, ping c2 from c1 through container name
sudo docker exec -it c1 ping c2

# catching telnet response
sudo docker exec -it c1 telnet c2 80

# creating a third container (out of bridge network we created)
sudo docker run -itd --name c3 busybox

# check if its running 
sudo docker ps

# check if we have connectivity with c1 and c2 containers
sudo docker exec -it c3 ping 10.0.0.254

sudo docker exec -it c3 ping c2

sudo docker exec -it c3 telnet c2 80

# creating my own network: rede-wordpress. 
# This network will store a wordpress application and database
sudo docker network create rede-wordpress

# listing networks
sudo docker network ls

# checking subnets
ip a

# creating a database container.
# Note: we put environment variable with "-e" parameter
sudo docker run --name wp-db -e MYSQL_ROOT_PASSWORD=mysql -d --net rede-wordpress mysql:5.7

# creating a web container (wordpress)
sudo docker run --name wp -e WORDPRESS_DB_HOST=wp-db -e WORDPRESS_DB_USER=root -e WORDPRESS_DB_PASSWORD=my_sql -p 8080:80 -d --net rede-wordpress wordpress

# check if containers are running
sudo docker ps

# check wp container with docker logs
sudo docker logs wp 

# check it in browser
localhost:8080
