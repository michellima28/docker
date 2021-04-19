# 01. create owncloud container
docker run --name owncloud -d -p 8090:80 --restart=always --network=net-backend -v /home/michel/owncloudapps:/var/www/hmtl/apps -v /home/michel/owncloud/config:/var/www/hmtl/config -v /home/michel/owncloud/data:/var/www/html/data -v /etc/localtime:/etc/localtime:ro owncloud

# 02. check if its running
docker ps 

# 03. check with logs 
docker logs -f owncloud

# 04. check it in browser
localhost:8090
