# 01. Create and initiate, in background, PSQL server container
# Image: https://hub.docker.com/_/postgres/
# Host port: 3333
# Container port: 5432
sudo docker run --name postgres-server -e POSTGRES_PASSWORD=1234 -d -p 3333:5432 postgres

sudo docker inspect postgres-server | grep IP

# 02. Create a database "teste" in a PSQL client container using governmentpaas/psql suggested image
# Image: https://hub.docker.com/r/governmentpaas/psql
sudo docker run --rm -it --name postgres-client governmentpaas/psql sh -c "psql -h 172.17.0.2 -U postgres --password"

create database TESTE;

\q

# 03. Download and use graphical pgAdmin in your host, access container server PSQL and view TESTE database you've created
# App: https://www.pgadmin.org/download/
Installed following these steps: https://www.pgadmin.org/download/pgadmin-4-apt/

Access via web: http://127.0.0.1/pgadmin4/
