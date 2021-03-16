![alt text](https://geekflare.com/wp-content/uploads/2020/03/docker-security-1200x385.jpg) 

# Docker

This repository was created to store Docker courses/training files and personal projects.

## Prerequisites

Linux Ubuntu or Mint (or based).

I have tested it on Feren OS, an Ubuntu based distro

## Installation using the repository

### 1. Set up the repository

#### 1.1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:

```bash
sudo apt-get update
```

```bash
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
```

#### 1.2. Add Docker’s official GPG key:

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

##### 1.2.1. Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint

```bash
sudo apt-key fingerprint 0EBFCD88
```

#### 1.3. Use the following command to set up the stable repository
##### Note: The lsb_release -cs sub-command below returns the name of your Ubuntu distribution, such as xenial. Sometimes, in a distribution like Linux Mint, you might need to change $(lsb_release -cs) to your parent Ubuntu distribution. For example, if you are using Linux Mint Tessa, you could use bionic. Docker does not offer any guarantees on untested and unsupported Ubuntu distributions.

```bash
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

##### 1.3.1. If you get the error: "malformed input repository not added", you can solve this by adding the repository manually.

```bash
sudo nano /etc/apt/sources.list.d/additional-repositories.list
```

add the following line in the file:

```bash
deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable
```

then, run:

```bash
sudo apt update
```

##### 1.3.2. If you are still getting this error, add the repository in /etc/apt/sources.list

```bash
sudo nano /etc/apt/sources.list
```

add the following line in the file:

```bash
deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable
```

then, run:

``` bash
sudo apt update
```

### 2. Install Docker Engine

#### 2.1. Update the apt package index, and install the latest version of Docker Engine and containerd.

```bash
sudo apt-get update
```

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

#### 2.2. Verify that Docker Engine is installed correctly by running the hello-world image. This command downloads a test image and runs it in a container. When the container runs, it prints an informational message and exits.

```bash
sudo docker run hello-world
```

## 3. Post-installation: running docker commands without sudo

#### 3.1. Create the docker group.

```bash
sudo groupadd docker
```

#### 3.2. Add your user to the docker group.

```bash
sudo usermod -aG docker $USER
```

#### 3.3. Log out and log back in so that your group membership is re-evaluated.

If testing on a virtual machine, it may be necessary to restart the virtual machine for changes to take effect.

On a desktop Linux environment such as X Windows, log out of your session completely and then log back in.

On Linux, you can also run the following command to activate the changes to groups:

```bash
newgrp docker
```

#### 3.4. Verify that you can run docker commands without sudo. This command downloads a test image and runs it in a container. When the container runs, it prints an informational message and exits.

```bash
docker run hello-world
```

## References

### Docker documentation

https://docs.docker.com/engine/install/ubuntu/

### Error when adding the repository

https://stackoverflow.com/questions/57402923/docker-installation-on-linux-mint-19-2-doesnt-work

### Post-installation: running docker commands without sudo

https://docs.docker.com/engine/install/linux-postinstall/
