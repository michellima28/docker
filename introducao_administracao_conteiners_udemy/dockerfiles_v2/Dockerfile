FROM ubuntu:18.04
RUN apt-get update && apt-get install -y apache2
WORKDIR /var/www/html
COPY index.html .
EXPOSE 80
CMD ["/usr/sbin/apache2ctl",  "-D", "FOREGROUND"]
