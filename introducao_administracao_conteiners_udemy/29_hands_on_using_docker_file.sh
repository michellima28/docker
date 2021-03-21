# 01. Writting your Dockerfile. Your Dockerfile must be created in a new directory and empty.
# Then, create a file named Dockerfile and insert content:
FROM ubuntu
RUN apt-get update -y
RUN apt-get install figlet -y

# 02. Initiate build process
docker build -t minhaimagem2 .

# 03. Execute a container from this image
docker run -it minhaimagem2

figlet hello

# 04. Inspecting created image. Docker history shows all image layers. For each layer, is shown 
# its creation time, size and command that generated it.

