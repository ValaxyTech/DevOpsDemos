##      ------ Nexus Installation ------

### Prerequisites

1. EC2 instance with java installation. 

```sh
# yum install java-1.8.0-openjdk -y
```
### Implementation steps 

2. Download and setup nexus stable version
```sh 
# cd /opt
# wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.2-02-unix.tar.gz
# tar -zxvf  nexus-3.0.2-02-unix.tar.gz
# mv /opt/nexus-3.13.0-01/ /opt/nexus
```

3. As a good security practice, it is not advised to run nexus service as root. so create new user called nexus. also grant sudo access. 
```sh 
# sudo adduser nexus
# visudo 
# sudo chown -R nexus:nexus /opt/nexus
```

4. Open /opt/nexus/bin/nexus.rc file, uncomment run_as_user parameter and set it as following.
```sh 
# vi /opt/nexus/bin/nexus.rc
```

5. Add nexus as a service 
```sh
# sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
```

6. Login as a nexus user and start service
```sh
# su - nexus
# service nexus start
```

7. Login nexus server from browser on port 8081

http://<Nexus_server>:8081

8. Use default credentials to login 

username : admin <br />
password : admin123


### Troubleshooting

1. service is not starting?
. make sure you are trying to start service with nexus user. 
. check java installation

2. Unable to access nexus URL?
make sure port 8081 is opened in security group. 
