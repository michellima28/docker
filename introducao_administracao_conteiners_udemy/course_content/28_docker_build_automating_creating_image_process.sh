# 01. Now, we'll create a new directory and a Docker File
mkdir dockerfiles

# 02. With vi editor, we will create the file and add docker commands
sudo vi Dockerfile

FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install apache2 -y

# 03. Now we'll run docker build to execute commands inside Docker file
# Note: we are using -t parameter, tagging attribute
docker build -t dockerdozero/web2:2.0 .

# 04. List created images and check "dockerdozero/web2" image that we've recently created with Docker build
docker images

# 05. Run a container from image we've recently create with Docker build
docker run -d --name web2 -p 8082:80 dockerdozero/web2:2.0 /usr/sbin/apache2ctl -D FOREGROUND

# 06. Check running containers
docker ps

# 07. Check in browser
localhost:8082

# 08. Now we are gonna change the image in Docker file, we're gonna use Debian 
vi Dockerfile 

FROM debian
RUN apt-get update
RUN apt-get install apache2 -y

# 09. We need to build again
docker build -t dockerdozero/web2:2.0 .
