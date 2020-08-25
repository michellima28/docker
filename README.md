# docker
couses and personal projects using docker

# prerequisites
linux ubuntu or mint (or based)
I have installed this on feren os, an ubuntu based distro

# installation using the repository

## 1. set up the repository
### 1.1 Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get update

sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    
### 1.2 Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#### 1.2.1 Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint
sudo apt-key fingerprint 0EBFCD88

### 1.3. Use the following command to set up the stable repository
### Note: The lsb_release -cs sub-command below returns the name of your Ubuntu distribution, such as xenial. Sometimes, in a distribution like Linux Mint, you might need to change $(lsb_release -cs) to your parent Ubuntu distribution. For example, if you are using Linux Mint Tessa, you could use bionic. Docker does not offer any guarantees on untested and unsupported Ubuntu distributions.
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#### 1.3.1 If you get the error: "malformed input repository not added", you can solve this by adding the repository manually.
sudo nano /etc/apt/sources.list.d/additional-repositories.list

add the following line in the file:

deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable

then, run:

sudo apt update

#### 1.3.2 If you are still getting this error, add the repository in /etc/apt/sources.list
sudo nano /etc/apt/sources.list

add the following line in the file:

deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable

then, run:

sudo apt update

## 2. install docker engine
### 2.1 Update the apt package index, and install the latest version of Docker Engine and containerd, or go to the next step to install a specific version:
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

### 2.2 Verify that Docker Engine is installed correctly by running the hello-world image. This command downloads a test image and runs it in a container. When the container runs, it prints an informational message and exits.
sudo docker run hello-world

# references

### docker documentation
https://docs.docker.com/engine/install/ubuntu/

### error when adding the repository
https://stackoverflow.com/questions/57402923/docker-installation-on-linux-mint-19-2-doesnt-work
