# 01. Create a new directory named "entrypoint"
mkdir entrypoint && cd entrypoint

# 02. Create a new Dockerfile named "entrypoint_ping" and put a ping localhost command entrypoint
FROM busybox 
ENTRYPOINT [ "ping", "localhost" ]

# 03. Build this image
# Note: we've used -f parameter, it indicates a Dockerfile with another name, different to the default's
docker build -t dockerdozero/entrypoint_ping:1.0 -f entrypoint_ping .

# 04. Check created image
docker images

# 05. Run a container from this image
# Note: we put a --rm parameter, it removes it after execution 
docker run --rm -it --name ping1 dockerdozero/entrypoint_ping:1.0

# 06. Now we're trying to run this container again but executing another command. We'll get an error, 
# because entrypoint was set to just execute "ping localhost" command
docker run --rm -it --name ping1 dockerdozero/entrypoint_ping:1.0 ps aux

# 07. Create a new Dockerfile named "entrypoint_ping_v2" and create an entrypoint with just a ping
# Create a CMD parameter with default value as localhost. Later, this parameter could be overwritten
FROM busybox
ENTRYPOINT [ "ping" ]
CMD [ "localhost" ]

# 08. Build image with this new Dockerfile, entrypoint_ping_v2
docker build -t dockerdozero/entrypoint_ping2:1.0 -f entrypoint_ping_v2 .

# 09. Check all images
docker images

# 10. Run a temporary container with this image
docker run --rm -it --name ping2 dockerdozero/entrypoint_ping2:1.0

# 11. Run a temporary container with this image but this time, changing parameter, instead of localhost
# we are going to use google.com
docker run --rm -it --name ping2 dockerdozero/entrypoint_ping2:1.0 google.com

# 12. Now we're change the entrypoint, instead of ping, we're going to put "ps" and pass "aux" as parameter
docker run --rm -it --name ping2 --entrypoint ps dockerdozero/entrypoint_ping2:1.0 aux
