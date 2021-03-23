# running an apache container on host's port 9090 access container port 80
sudo docker run -d --name c1_apache -p 9090:80 httpd

# check active containers
sudo docker ps

# running an apache container using automatic option to choose port
sudo docker run -d --name c2_apache -P httpd

# check c2_apache port
sudo docker port c2_apache

# view active containers
sudo docker ps

# now, check apache URLs in your browser
# it must appear a message: It works!
http://localhost:9090/
http://localhost:32768/ 
