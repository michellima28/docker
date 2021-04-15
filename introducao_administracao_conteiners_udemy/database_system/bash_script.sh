# 01. creating network
sudo docker network create net-backend

# 02. check if it was really created
docker network ls

# 03. create database container
docker run --name mysql --restart=always --network=net-backend -v /home/michel/mysql/conf:/etc/mysql/conf.d -v /home/michel/mysql/:/var/lib/mysql/ -v /etc/localtime:/etc/localtime:ro -e MYSQL_ROOT_PASSWORD=admin -d mysql:5.5

# 04. check if its running
docker ps 

# 05. check logs
docker logs -f mysql

# 06. create php my admin container
docker run --name myadmin --restart=always --network=net-backend -d -e PMA_HOST=mysql -v /etc/localtime:/etc/localtime:ro -p 8010:80 phpmyadmin/phpmyadmin:4.7.0-1

# 07. check if its running
docker ps 

# 08. check logs
docker logs -f myadmin

# 09. check again if both containers are running
docker ps 

# 10. now, check in your browser if php my admin is running
localhost:8010

# 11. if you see php my admin's home screen, type root's password that you set in image on image creation
password=admin 

# 12. create a test database in php my admin console and then check it in mysql through terminal
create database teste;

docker exec -it mysql bash

mysql -u root -p 

show databases;

exit

exit

# 13. let's see the files in our configuration folder
cd /home/michel/mysql/

ll 

# 14. Make a test: create a configuration file that allows maximum packet to 16M
sudo vim custom.cnf

[mysqld]
max_allowed_packet=16M

# 15. check if maximum packet is 16M in mysql container
docker exec -it mysql bash

cd /var/lib/mysql/conf/

cat custom.cnf

exit 

# 16. now, change to 32M in host and check it in mysqlcontainer again
cd /home/michel/mysql/conf 

ls 

[mysqld]
max_allowed_packet=32M

docker exec -it mysql bash

cd /var/lib/mysql/conf/

cat custom.cnf

exit

# 17. Last check, stop and remove container, after doing this, start it again and you'll see
# that teste database and maximum allowed packet still remain because of the volume mapping
docker stop mysql

docker rm mysql

docker run --name mysql --restart=always --network=net-backend -v /home/michel/mysql/conf:/etc/mysql/conf.d -v /home/michel/mysql/:/var/lib/mysql/ -v /etc/localtime:/etc/localtime:ro -e MYSQL_ROOT_PASSWORD=admin -d mysql:5.5

docker exec -it mysql bash

mysql -u root -p

show databases;

exit 

cat /var/lib/mysql/conf/custom.cnf

exit 

# 18. make a dump of all databases to host volume
docker exec mysql sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > /home/michel/all-mysql.sql

cat /home/michel/mysql/all-mysql.sql

sudo mv all-mysql.sql ~/mysql/

cd ~/mysql/ && ls -lha
