# creating first container 
sudo docker run -itd --name l1 busybox

# creating second container and linking it to the first one
sudo docker run -itd --name l2 --link l1:linkalias busybox

# list active containers
sudo docker ps

# creating a third container and linking it to the first and second ones
sudo docker run -itd --name l3 --link l1:meul1 --link l2:meul2 busybox

# list active containers
sudo docker ps

# ping l1 from l2
sudo docker exec -it l2 ping l1

# the opposite will not work because container links only work from source to target and to vice versa
sudo docker exec -it l1 ping l2

# l3 container has link aliases to l1 and l2 containers. Check it out:
sudo docker exec -it l3 ping meul1

sudo docker exec -it l3 ping meul2

# but they (l1 and l2) don't have connection with l3
sudo docker exec -it l2 ping l3

# now, we are gonna create and run another database and wordpress containers using container links
sudo docker run -d --name db1 -e MYSQL_ROOT_PASSWORD=mysql mysql:5.7

sudo docker run -d  --name wp1 --link db1:meudb -p 8090:80 wordpress

# check it in browser
localhost:8090
