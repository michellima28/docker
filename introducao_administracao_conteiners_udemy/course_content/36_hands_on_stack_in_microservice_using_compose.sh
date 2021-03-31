# 01. clone this repo:
git clone https://github.com/ricardoferreiracosta08/cursos-udemy.git

# 02. Go to: /curso-dockerdozero/secao10-DockerCompose/example-voting-app/
cd /curso-dockerdozero/secao10-DockerCompose/example-voting-app/

# 03. To execute web app and all microservices, execute docker-compose
docker-compose -f docker-compose.yml up

# 04. Check the app in browser, port 5000 for voting and 5001 for results
localhost:5000
localhost:5001
