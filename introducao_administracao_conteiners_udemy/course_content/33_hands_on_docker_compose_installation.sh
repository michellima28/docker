# installation on Linux
# pay attention to the last version, you must replace X.XX.XX to the last version
sudo curl -L https://github.com/docker/compose/releases/download/X.XX.XX/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

# apply permissions
sudo chmod +x /usr/local/bin/docker-compose

# testing
docker-compose --version
