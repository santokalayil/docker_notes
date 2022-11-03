
# uinstall 
sudo apt remove docker.io docker-compose

sudo apt install docker.io

# check if docker is installed and its version
docker -v

# starting docker service
sudo systemctl start docker
sudo systemctl enable docker

# checking docker status - if docker is running or not
sudo systemctl status docker

# testing an image from docker hub
sudo docker run hello-world

# use docker wihout sudo
sudo groupadd docker
sudo usermod -aG docker $USER
su $USER # and type password for the user

# lists all the docker containers
docker ps

# pulling a docker image from docker-hub
docker pull ubuntu
# docker pull ubuntu:22.10

docker images

# running the ubuntu container
docker run ubuntu

# port forwarding for the container - port 8000 of local machine to port number 80 of docker container
docker run -p 8000:80 ubuntu

docker run -p 8501:8501 ubuntu


# stopping the container - using the container id from docker ps
docker stop <container_id>

# removing the container - using the container id from docker ps
docker rm <container_id>


# running docker container continuously for debugging or development purpose
docker run -d -t ubuntu

# get inside docker container
docker exec -it <container_id> bash


# copy files - first after creating a dir named 'src' inside the root dir , get out of docker container and then copy files
docker cp files_to_be_copied/install.sh <container_id>:/src/install.sh # first create a src folder inside the root folder of docker container


## docker-compose -Dockerfile
# create Dockerfile and build
docker build -t ubuntu . # -t is for naming the image
# docker build -t ubuntu_ezeauto .
docker build -t ubuntu_insta .
# docker build -t ubuntu_insta:latest .


# the docker image is now ready to be used with new build options -- a new tag will be given to the image - for my case latest is given as tag therefore I can use it with the command below
docker run -d -t ubuntu:latest  # here -d is not needed if debugging is not required - continious running is not required


# mount a folder inside the docker container
# source dir will change see pwd 
docker run -v /home/ezetap-eze10194/Documents/DOCKERS/resume/project/:/project/ -p 8501:8501  -d -t ubuntu:latest
docker run -v /home/ezetap-eze10194/Documents/OTHER_WORK_PROJECTS/INSTA_POST_OBJECT_n_PII_DETECTION/:/project/ -p 8080:8501  -d -t ubuntu_insta:latest

docker run -v /home/ezetap-eze10194/Documents/OTHER_WORK_PROJECTS/INSTA_POST_OBJECT_n_PII_DETECTION/:/project/ -d -t ubuntu_insta



# Docker compose file model 'docker-compose.yaml'
version: '3.0'
services:
  web: 
    # container_name: JSON_WEB_APP
    # image: eze_json_webapp
    build:
      dockerfile: ./Dockerfile
      context: ./
    ports:
      - '8501:8501'
    volumes:
      - ./:/project/


docker-compose up --build   # to build from scrach the image using dockerfile
docker-compose -v
docker-compose config
docker-compose up -d
docker-compose down
docker ps


docker run -v /home/ezetap-eze10194/Documents/OTHER_WORK_PROJECTS/WEB_APP_JSON/:/project/ -d -t eze_json_webapp



