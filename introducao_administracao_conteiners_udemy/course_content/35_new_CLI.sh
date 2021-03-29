# first of all, we need to go to our project folder otherwise docker-compose is not gonna work
cd compose

# running docker-compose file
docker-compose up

# running in background
docker-compose up -d

# to see all docker-compose services, type:
docker-compose ps

# showing all docker-compose images
docker-compose images

# service created its own docker network named "compose_default"
docker network ls

# to see all logs, type:
docker-compose logs

# now we're gonna run service again but we're gonna create a volume before. Edit docker-compose file
version: '3'
services: 
  web:
    build: .
    ports:
      - "8083:8080"
    volumes:
      - .:/code    
  redis:
    image: "redis:alpine"

# to see all services 
docker-compose top



