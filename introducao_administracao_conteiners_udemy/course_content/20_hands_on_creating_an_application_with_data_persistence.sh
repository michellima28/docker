# 01. Create a folder to the web application
sudo mkdir docker
cd docker
sudo mkdir site 
cd site 

# 02. Create a basic index.html file
sudo touch index.html

sudo chmod 777 index.html 

sudo echo "<h1>My First Web Page</h1>" >> index.html

cat index.html 

# 03. Use the first volume mapping method (host volume)
sudo docker run -d --name web_pasta -v /home/michel/docker/site:/usr/local/apache2/htdocs -P httpd

sudo docker port web_pasta

# 04. Access browser in url http://localhost:[PORT]
http://localhost:32768/

# 05. To use Docker Volume, create your first volume
sudo docker volume create --name datastore

# 06. Create an application that uses this volume
# note: access via browser localhost:9090 and see that it will show you default message "it works!"
# it happened because via docker volume data are not overwritten
sudo docker run -itd --name containervolume -v datastore:/usr/local/apache2/htdocs -p 9090:80 httpd

http://localhost:9090/

# 07. Copy index.html to volume using cp
sudo docker cp /home/michel/docker/site/index.html containervolume:/usr/local/apache2/htdocs

# 08. Remove container
sudo docker stop containervolume

sudo docker rm -f containervolume

# 09. Iniciate another container web with the same volume created before
sudo docker run -itd --name containervolume2 -v datastore:/usr/local/apache2/htdocs -p 9091:80 httpd

# 10. List and remove volume
# note: first, container must be stopped and then removed. After, you remove Docker volume
sudo docker stop containervolume2

sudo docker rm containervolume2

sudo docker volume rm datastore
