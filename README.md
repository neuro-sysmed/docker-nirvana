# docker-nirvana

Based on this docker file:
https://github.com/MichaelStromberg-Illumina/DotNetMisc/blob/master/Dockerfiles/Nirvana/Dockerfile


# build and push 
docker build -t bruggerk/nirvana:3.17.0
docker push bruggerk/nirvana:3.17.0

## docker login

docker login --username bruggerk
password: 