1. Lanunch an EC2 instance for Docker host

2. Install docker on EC2 instance and start services 
```sh 
yum install docker
service start docker 
```

3. create a new user for Docker management and add him to docker (default) group
```sh
useradd dockeradmin
passwd dockeradmin
usermod -aG dockeradmin
```

4. Write a docker file under /opt/docker
```sh
mkdir /opt/docker

vi Dockerfile
# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "valaxytech@gmail.com" 

# copy war file on to container 
COPY ./webapp.war /usr/local/tomcat/webapps
```

5. Login to Jenkins console and add 
Manage Jenkins --> Configure system -->  Publish over SSH --> add docker server and credentials

6. Create Jenkins job 

A) Source Code Management
 Repository : https://github.com/ValaxyTech/hello-world.git
 Branches to build : */master

B) Build
 Root POM: pom.xml
 Goals and options : clean install package
 
C) send files or execute commands over SSH
 Name: docker_host
 Source files	: webapp/target/*.war
 Remove prefix	: webapp/target
 Remote directory	: //opt//docker
 Exec command	: docker stop valaxy_demo; docker rm -f valaxy_demo; docker image rm -f valaxy_demo; cd /opt/docker; docker build -t valaxy_demo .

D) send files or execute commands over SSH
  Exec command	: docker run -d --name valaxy_demo -p 8090:8080 valaxy_demo

7. Login to docker host and check images and containers

8. Execute jenkins job

9. check images and containers again on docker host. This time an image and container get creates through jenkins job

10. Access web application from browser 
<docker_host_Public_IP>:8080

