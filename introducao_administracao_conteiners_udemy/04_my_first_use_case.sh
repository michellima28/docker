# MODE 1: scan an IP address using nmap tool through a nmap image
sudo docker run --rm uzyexe/nmap -sS google.com

# MODE 2: scan an IP address using nmap tool through an ubuntu image
sudo docker run -it --name nmap ubuntu:18.04 bash

apt-get update && apt-get install nmap && nmap -sS google.com
