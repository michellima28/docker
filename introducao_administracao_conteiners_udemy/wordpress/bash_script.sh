# 01. create a wordpress container
docker run --name wordpress --restart=always --network=net-backend -e WORDPRESS_DB_HOST=mysql -e WORDPRESS_DB_USER=root -e WORDPRESS_DB_PASSWORD=admin -v /home/michel/wordpress/:/var/www/html/ -v /home/michel/wordpress/conf.d/uploads.ini:/usr/local/etc/php/conf.d/uploads.ini -v /etc/localtime:/etc/localtime:ro -d -p 8011:80 wordpress:4.7-php5.6

# 02. check logs
docker logs -f wordpress

# 03. check with docker ps
docker ps 

# 04. check application in your browser
localhost:8011
