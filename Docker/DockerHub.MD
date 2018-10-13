## What is Docker Hub Registry

Docker Hub is a cloud-based registry service which allows you to link to code repositories, build your images and test them, stores manually pushed images, and links to Docker Cloud so you can deploy images to your hosts. It provides a centralized resource for container image discovery, distribution and change management, user and team collaboration, and workflow automation throughout the development pipeline.

##### Ref URL : https://docs.docker.com/docker-hub/

1. Pull a docker image 

```sh 
docker pull ubuntu
```

2. pull a docker image with old version

```sh
docker pull ubuntu:16.04
```

3. create a custom tag to docker image
```sh
docker tag ubuntu:latest valaxy/ubuntu:demo
```

4. login to your docker hub registry 
``sh
docker login
```
5. docker push valaxy/ubuntu:demo
```

### testing 

6. Remove all images in docker server 
```sh 
docker image rm -f <Image_id>
```

7. Pull your custom image from your docker account
```sh
docker pull valaxy/ubuntu:demo
```

