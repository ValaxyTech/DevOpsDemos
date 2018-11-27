# Nexus Installation
Nexus is one an artifact repository which helps to store your build outcomes. 
Get help 
Follow this article in **[YouTube](https://www.youtube.com/watch?v=83AGz9huJGo)
### Prerequisites

1. EC2 instance with java 

### Implementation steps 

Download and setup nexus stable version
```sh 
# cd /opt
# wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.2-02-unix.tar.gz
# tar -zxvf  nexus-3.0.2-02-unix.tar.gz
# mv /opt/nexus-3.13.0-01/ /opt/nexus
```

As a good security practice, it is not advised to run nexus service as root. so create new user called nexus and grant sudo access to manage nexus services 
```sh 
# sudo adduser nexus
# visudo 
# sudo chown -R nexus:nexus /opt/nexus
```

Open /opt/nexus/bin/nexus.rc file, uncomment run_as_user parameter and set it as following.
```sh 
# vi /opt/nexus/bin/nexus.rc
```

Add nexus as a service at boot time
```sh
# sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
```
Login as a nexus user and start service
```sh
# su - nexus
# service nexus start
```

Login nexus server from browser on port 8081

http://<Nexus_server>:8081

Use default credentials to login 

username : admin <br />
password : admin123


### Troubleshooting

service is not starting?
 - make sure you are trying to start service with nexus user. 
- check java installation

Unable to access nexus URL?
- make sure port 8081 is opened in security group. 

### Next Steps
- [x] [Configure Users & Groups in Jenkins](https://youtu.be/jZOqcB32dYM)
- [x] [Secure your Jenkins Server](https://youtu.be/19FmJumnkDc)
- [x] [Jenkins Plugin Installation](https://youtu.be/p_PqPBbjaZ4)
- [x] [Jenkins Master-Slave Configuration](https://youtu.be/hwrYURP4O2k)
