# 01. Based on Dockerfile you've recently created, add "CMD figlet -f script hello"
# at the end of the file
# CMD is the default argument to be executed
FROM ubuntu
RUN apt-get update -y
RUN apt-get install figlet -y
CMD figlet -f script hello

# 02. Initiate build process. 
# Build 
docker build -t minhaimagemcmd .

# Execute a container from this image
docker run minhaimagemcmd

# 03. Overwritting CMD instruction
# To replace default command to a shell bash execution, instead of figlet, we must let explicit 
# the "new CMD"
docker run -it minhaimagemcmd bash

# 04. Using ENTRYPOINT into a Dockerfile
# replace Dockerfile content to this:
# ENTRYPOINT defines a "base command and its parameters" when the container runs
FROM ubuntu
RUN apt-get update -y
RUN apt-get install figlet -y
ENTRYPOINT ["figlet", "-f", "script"]

# 05. Initiate build process
# Execute:
docker build -t minhaimagem_entrypoint .

# Create a container
docker run minhaimagem_entrypoint salut

# 06. CMD and ENTRYPOINT together
# Replace Dockerfile content to this:
FROM ubuntu
RUN apt-get update -y
RUN apt-get install figlet -y
ENTRYPOINT ["figlet", "-f", "script"]
CMD ["hello world"]

# ENTRYPOINT defines a "base command and its parameters" when the container runs
# if no arguments specified, CMD value will be used as default
# Otherwise, the argument passed in the beggining of the container will be used instead of CMD

# 07. Initiating build process
# Execute:
docker build -t minhaimagem_cmdentrypoint .

# Create a container without parameters
docker run minhaimagem_cmdentrypoint

# 08. Overwritting image's parameters
# Now we'll pass extras parameters
# We have replaced CMD but ENTRYPOINT still remains
docker run minhaimagem_cmdentrypoint hola mundo

# overwritting ENTRYPOINT
docker run -it --entrypoint bash minhaimagem_cmdentrypoint

# Compiling C code
# Create a new project directory and put all these files: hello.c and Dockerfile

# hello.c:

int main () {
  puts("Hello, world!");
  return 0;
}

# Dockerfile
# in Debian and Ubuntu, build-essential package allow us to work with all compilation resources
# COPY instruction copies current directory hello.c file into the image
FROM ubuntu
RUN apt-get update
RUN apt-get install -y build-essential
COPY hello.c /
RUN make hello
CMD /hello

# create C program
# build
docker build -t helloworld .

# create container
docker run helloworld
