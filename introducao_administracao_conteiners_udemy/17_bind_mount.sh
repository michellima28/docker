# creating a new apache container running in background, in host port 9090
# creating data persitence mapping host folder with container folder 
sudo docker run -itd --name apache -p 9090:80 -v /home/michel/site:/usr/local/apache2/htdocs httpd:2.4

# check active containers
sudo docker ps

# access apache container with terminal interaction and creating a file in data folder
sudo docker exec -it apache bash

cd /usr/local/apache2/htdocs/
ls 
touch index.html
exit

# checking created file inside container in your host mapped folder
ls /home/michel/site/

# writting in index.html file and getting content via curl
cd /home/michel/site/

sudo chmod 777 index.html 

sudo echo "<h1>My First Web Container</h1>" >> index.html

sudo curl http://localhost:9090

# removing container and checking if file is still in mapped folder
sudo docker rm -f apache

ls 

cat index.html 

# creating and running another apache container, in background, with the same data folder mapping
sudo docker run -d --name apache2 -p 9090:80 -v /home/michel/site:/usr/local/apache2/htdocs httpd:2.4

sudo docker ps 

# checking data persitence
curl http://localhost:9090

# checking date difference between host and container 
date

sudo docker exec -it apache2 date

# removing apache container again
sudo docker rm -f apache2

# creating apache container again with same mapping but this time, mapping localtime binary file too 
sudo docker run -d --name apache2 -p 9090:80 -v /home/michel/site:/usr/local/apache2/htdocs -v /etc/localtime:/etc/localtime:ro httpd:2.4

# checking host and container date again, note that now, both are the same 
date 

sudo docker exec -it apache2 date
