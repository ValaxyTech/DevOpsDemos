# Tomcat installation on EC2 instance

### Follow this article in **[YouTube](https://www.youtube.com/watch?v=m21nFreFw8A)**
### Prerequisites
1. EC2 instance with Java v1.8.x 

### Install Apache Tomcat
we are going to download tomcat packages from  https://tomcat.apache.org/download-80.cgi onto /opt on EC2 instance
```sh 
  # create tomcat directory
  cd /opt
  wget http://mirrors.fibergrid.in/apache/tomcat/tomcat-8/v8.5.35/bin/apache-tomcat-8.5.35.tar.gz
  tar -xvzf /opt/apache-tomcat-8.5.35.tar.gz
```
give executing permissions to startup.sh and shutdown.sh which are under bin. 
```sh
   chmod +x /opt/apache-tomcat-8.5.35/bin/startup.sh shutdown.sh
```

create link files for tomcat startup.sh and shutdown.sh 
```sh
  ln -s /opt/apache-tomcat-8.5.35/bin/startup.sh /usr/local/bin/tomcatup
  ln -s /opt/apache-tomcat-8.5.35/bin/shutdown.sh /usr/local/bin/tomcatdown
  tomcatup
```
#### check point :
access tomcat application from browser on prot 8080
http://<Public_IP>:8080

Using unique ports for each application is a best practice in a environment. But tomcat and Jenkins runs on ports number 8080. Hence lets change tomcat cat port number to 8090. To change port number we should update server.xml file which is in conf directory under tomcat home
```sh
cd /opt/apache-tomcat-8.5.35/conf
# update port number in the "connecter port" field in server.xml
#restart tomcat after configuration update
tomcatdown
tomcatup
```
#### check point :
access tomcat application from browser on prot 8090
http://<Public_IP>:8090

now application is accessible on port 8090. but if you try to login to tomcat from the browser it doesn’t allow. you need to change some default parameters in context.xml
```sh
#search for context.xml
find / -name context.xml
```
above command gives 3 context.xml files. Out of 3, 2 files resides on webapp directory. We should comment (<!-- & -->) `Value ClassName` field on files which are under webapp directory. 
restart tomcat services to take this effect
```sh 
tomcatdown
tomcatup
```
Update users information in the tomcat-users.xml file
goto tomcat home directory and Add below users to tomcat-user.xml file under conf directory
```sh
	<role rolename="manager-gui"/>
	<role rolename="manager-script"/>
	<role rolename="manager-jmx"/>
	<role rolename="manager-status"/>
	<user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>
	<user username="deployer" password="deployer" roles="manager-script"/>
	<user username="tomcat" password="s3cret" roles="manager-gui"/>
```
Restart serivce and try to login to tomcat application from the browser

