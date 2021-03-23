# creating another container running in background 
# with temporary RAM memory persistence in /tmp container's folder
sudo docker run -itd --name tmpfs --tmpfs /tmp busybox

# show active containers
sudo docker ps

# running a commnad in tmpfs container
sudo docker exec tmpfs df -h

# creating a 3Gb file inside container in /tmp folder (it will run in RAM memory)
# at the end the command you remove it
sudo docker exec -it tmpfs dd if=/dev/zero of=/tmp/output bs=3k count=1000K; rm -f /tmp/output

# creating a 3Gb file inside container in / folder (it will run in Disk)
# at the end the command you remove it
sudo docker exec -it tmpfs dd if=/dev/zero of=/output bs=3k count=1000K; rm -f /output
