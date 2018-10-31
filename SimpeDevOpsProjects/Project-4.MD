# Simple DevOps Project - 04

In this project, we will be seeing how to *use Git, Jenkins, Ansible, DockerHub, Docker to DEPLOY on docker containers.,*

*Follow this project in *[Youtube](https://www.youtube.com/c/valaxytechnologies)**

#### PreRequisites
1. Jenkins - Get help [here](https://www.youtube.com/watch?v=M32O4Yv0ANc)
1. Ansible Get help [here](https://www.youtube.com/watch?v=79xFyOc_eEY)

In *part-01* we create Docker image on ansible server through Jenkins job and pushed it onto DockerHub. 

### Part-01:
1. Launch an EC2 instance for Docker host
1. Install docker on EC2 instance and start services 
    ```sh 
    yum install docker
    service docker start
    ```
1. Create a new user for Docker management add user to Docker (default) group
    ```sh
    # creating dockeradmin user
    useradd dockeradmin
    passwd dockeradmin
    # Adding user to docker group
    usermod -aG docker dockeradmin
    ```
    
1. Login to Jenkins console
1. Create *Jenkins job*, Fill in the following values,
   - *Source Code Management:*
      - Repository : `https://github.com/ValaxyTech/hello-world.git`
      - Branches to build : `*/master`  
   - *Build:*
     - Root POM:`pom.xml`
     - Goals and options : `clean install package`
   - *Post Steps*
     - *Send files or execute commands over SSH*
       - Name: `ansible_server`
       - Source files	: `webapp/target/*.war`
       - Remove prefix	: `webapp/target`
       - Remote directory	: `//opt//docker`

     - *Send files or execute commands over SSH*
       - Name: `ansible_server`
       - Source files	: `Dockerfile`
       - Remote directory	: `//opt//docker`
       - Exec Command: 
	      - `cd /opt/docker`
          - `docker build -t valaxy_demo:v1.0 .`
      - *Send files or execute commands over SSH*
        - Name: `ansible_server`
        - Source files: `Dockerfile`
        - Remote directory: `//opt//docker`
        - Exec Command:
	       ```sh
	          docker tag valaxy_demo:v1.0 valaxy/valaxy_demo:v1.0
              docker push valaxy/valaxy_demo:v1.0
              docker rmi valaxy_demo:v1.0 valaxy/valaxy_demo:v1.0
              ```
1. Login to Docker host and check images and containers. (no images and containers)
1. login to docker hub and check no images with for valaxy_demo 

1. Execute Jenkins job

1. check images in Docker hub

#### Troubleshooting:
1. Docker should be installed on ansible server 
1. Should login to "docker hub" on ansible server
1. Docker admin user should be part of `docker` group

in *Part-02* we we create *create_docker_container.yml* playbook. this get intiated by jenkins job, run by ansible and exected on dokcer host

### Part-02 

1. Write a yml file to create a container 
   ```yaml
     ---
     - hosts: web-servers
       become: true
       tasks:
        - name: stop previous version docker
          shell: docker stop valaxy_demo
        - name: remove stopped container
          shell: docker rm -f valaxy_demo
          
        - name: create docker image
          shell: docker run -d --name valaxy_demo -p 8090:8080 valaxy/valaxy_demo

1. Add this script to Jenkins job.
   - Chose *"configure"* to modify your jenkins job. 
     - *Under post build actions*
        - Send files or execute commands over SSH
          - Exec Command: 
          ```sh
             cd /opt/playbooks
             ansible-playbook create_docker_container.yml
            ```
          
1. Execute Jenkins job. 

1. You could see a new container on your docker host. access it from browser

In *Part-03* we try to improvise to store previous versions
### Part-03

So for we used latest docker image to build a container, but what happens if latest version is not working?
One easiest solution is, maintaining version for each build. this can be achieved by using environment variables. 

here we use 2 variables 
- `BUILD_ID` -  The current build id
- `JOB_NAME` - Name of the project of this build. This is the name you gave your job when you first set it up.

for more info Please refer [this URL](https://wiki.jenkins.io/display/JENKINS/Building+a+software+project)

Let us modify jenkins job which was created in *Part-01* 

1. Create Jenkins job 
   - *Source Code Management:*
      - Repository : `https://github.com/ValaxyTech/hello-world.git`
      - Branches to build : `*/master`  
   - *Build:*
     - Root POM:`pom.xml`
     - Goals and options : `clean install package`
 
   - *Send files or execute commands over SSH*
     - Name: `ansible_server`
     - Source files	: `webapp/target/*.war`
     - Remove prefix	: `webapp/target`
     - Remote directory	: `//opt//docker`

   - *Send files or execute commands over SSH*
     - Name: `ansible_server`
     - Source files	: `Dockerfile`
     - Remote directory	: `//opt//docker`
     - Exec Command: 
	    ```sh
	      cd /opt/docker
          docker build -t $JOB_NAME:v1.0.$BUILD_ID .
          ```
    - *Send files or execute commands over SSH*
      - Name: `ansible_server`
      - Source files: `Dockerfile`
      - Remote directory: `//opt//docker`
      - Exec Command:
        ```sh
        docker tag $JOB_NAME:v1.0.$BUILD_ID valaxy/$JOB_NAME:v1.0.$BUILD_ID
        docker tag $JOB_NAME:v1.0.$BUILD_ID valaxy/$JOB_NAME:latest
        docker push valaxy/$JOB_NAME:v1.0.$BUILD_ID 
        docker push valaxy/$JOB_NAME:latest
        docker rmi $JOB_NAME:v1.0.$BUILD_ID valaxy/$JOB_NAME:v1.0.$BUILD_ID   valaxy/$JOB_NAME:latest
        ```
##### References
[1] - [Jenkins Docs - Building Software Projects](https://wiki.jenkins.io/display/JENKINS/Building+a+software+project)
