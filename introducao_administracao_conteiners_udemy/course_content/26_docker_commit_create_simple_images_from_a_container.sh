# create a temporary container in background
sudo docker run -itd --name temp debian bash

# access container's terminal
sudo docker exec -it temp bash

# update and install apache2 inside container
apt-get update && apt-get install apache2

# exit from container
exit

# stop container
sudo docker stop temp 

# generating image
sudo docker commit temp dockerdozero/debian_web:1.0

# checking if image has been created correctly
sudo docker images

# running a container from the image that we've been created (dockerdozero/debian_web:1.0)
# note: we have one more argument, an argument that specifies apache2 binary file to initiate the app
sudo docker run -d --name minhaappweb -p 8081:80 dockerdozero/debian_web:1.0 /usr/sbin/apache2ctl -D FOREGROUND

# test it in web, in your browser
localhost:8081
