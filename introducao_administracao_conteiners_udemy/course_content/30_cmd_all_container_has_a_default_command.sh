# 01. Create a new directory named "dockerfiles_v2", a new Dockerfile and a new index.html
# and then build it with "docker build" command
docker build -t dockerdozero/apache2_cmd:1.0 .

# 02. Run a new container from this image
docker run -d -p 8090:80 dockerdozero/apache2_cmd:1.0

# 03. Check in browser
localhost:8090

# 04. Running another container from this image but this time, we'll not execute the default command
# that we've set in Dockerfile, we'll run "ps aux" command and overwrite default command
docker run -it dockerdozero/apache2_cmd:1.0 ps aux
