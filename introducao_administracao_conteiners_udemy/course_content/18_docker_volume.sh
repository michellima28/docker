# creating docker volume
sudo docker volume create vol-web

# creating a container with hybrid mapping
# bind mount: mapping localtime binary file
# bind volume: using recently created docker volume
sudo docker run -d --name apache_vol -p 9091:80 -v /etc/localtime:/etc/localtime:ro -v vol-web:/usr/local/apache2/htdocs httpd:2.4

# check active containers
sudo docker ps

# getting index file content from localhost:9091
# note: when using docker volume, it doesn't overwrite container file
curl http://localhost:9091

# now, copying custom index.html file from host to container
sudo docker cp /home/michel/site/index.html apache_vol:/usr/local/apache2/htdocs

# checking new file content with curl
curl http://localhost:9091

# change container file using cp
# first: we will copy container file to our volume
# second: we will make changes in index.html and send it to container again
cd /home/michel/site/

sudo docker cp apache_vol:/usr/local/apache2/htdocs/index.html .

ls 

sudo echo "<hr/> <h2>Subtitle" >> index.html

cat index.html

sudo docker cp index.html apache_vol:/usr/local/apache2/htdocs

curl http://localhost:9091

# change container file using docker directories (NOT RECOMMEDED)
# first: we will make changes in index.html inside docker volume directory
# second: we will send it to container
sudo ls /var/lib/docker/volumes/

sudo cat /var/lib/docker/volumes/vol-web/_data/index.html

sudo echo "<br/> <h3>END</h3>" >> /var/lib/docker/volumes/vol-web/_data/index.html

cat /var/lib/docker/volumes/vol-web/_data/index.html

curl http://localhost:9091
