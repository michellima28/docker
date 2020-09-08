# network bridge information
sudo docker network inspect bridge

# host networks
ip a

# creating first sample container with busybox image
sudo docker run -itd --name c1 busybox

# creating second sample container with ubuntu image
sudo docker run -itd --name c2 ubuntu

# listing active containers
sudo docker ps

# getting c1 connectivity information
sudo docker exec c1 ip a

# inspect c1 IPs 
sudo docker inspect c1 | grep IP

# inspect c2 IPs 
sudo docker inspect c2 | grep IP

# ping c2 from c1
sudo docker exec c1 ping 172.17.0.3

# host networks
# note: now there's the two container's vetha 
ip a
