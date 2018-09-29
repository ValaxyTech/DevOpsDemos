
1. setup mysql RDS instance and allow to access sonarqube server. 

2. Install mysql client version 
```sh
yum install mysql mysql-php php
```
3. Install java 
```sh
yum install java-1.8.0-openjdk -y
```
4. Create a new sonar database

CREATE DATABASE sonar CHARACTER SET utf8 COLLATE utf8_general_ci;

5. Create a local and a remote user
```sh
CREATE USER sonar@localhost IDENTIFIED BY 'sonar';
CREATE USER sonar@'%' IDENTIFIED BY 'sonar';
```sh 

6. Grant users permissions
```
GRANT ALL ON sonar.* TO sonar@localhost;
GRANT ALL ON sonar.* TO sonar@'%';
```sh 

7. check users and databases 
```
use mysql
show databases;
SELECT User FROM mysql.user;
FLUSH PRIVILEGES;
QUIT
```sh 

8. Download Latest sonarqube version from website. 
website: https://www.sonarqube.org/downloads/

Note: for this video I have downloaded version 6.0 : https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.0.zip

9. download & unzip it to EC2 instance
```
cd /opt
wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.0.zip
unzip sonarqube-6.0.zip
mv /opt/sonarqube-6.0 /opt/sonar
```sh

10. edit sonarqube properties file 
```
vi /opt/sonar/conf/sonar.properties
sonar.jdbc.username=sonar
sonar.jdbc.password=sonar
mysql://sonarqubedb.c3rw4o6y09ny.ap-southeast-1.rds.amazonaws.com:3306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useConfigs=maxPerformance&useSSL=false
sonar.web.context=/sonar
sonar.web.host=0.0.0.0
```sh 

11. Implement SonarQube server as a service [optional]
```
Copy sonar.sh to etc/init.d/sonar and modify it according to your platform.
sudo cp /opt/sonar/bin/linux-x86-64/sonar.sh /etc/init.d/sonar
sudo vi /etc/init.d/sonar
```sh 

12. add below values to your /etc/init.d/sonar file
```
Insert/modify below values
SONAR_HOME=/opt/sonar
PLATFORM=linux-x86-64

WRAPPER_CMD="${SONAR_HOME}/bin/${PLATFORM}/wrapper"
WRAPPER_CONF="${SONAR_HOME}/conf/wrapper.conf"
PIDDIR="/var/run"
```sh

Run SonarQube server
```
service sonar start
```sh
