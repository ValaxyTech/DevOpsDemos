##                                 ------ SonarQube Installation ------ 

To install SonarQube we need an Linux EC2 instance which is installed MySQL otherwise Launch MySQL RDS instance to acomplish this

1. Launch an MySQL RDS Database Instance (It takes few minutes) 

2. Launch an EC2 instance and Install MySQL client version 

```sh
# yum install mysql
```

3. Install java 
```sh
# yum install java-1.8.0-openjdk -y
```
4. Download stable SonarQube version from below website. 
website: https://www.sonarqube.org/downloads/

Note: for this video I have downloaded version 6.0 : https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.0.zip

5. download & unzip it to Linux EC2 instance
```sh
# cd /opt
# wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.0.zip
# unzip sonarqube-6.0.zip
# mv /opt/sonarqube-6.0 /opt/sonar
```
6. Allow RDS instance security group to access SonarQube server 

7. Connect to RDS instance 
```sh 
mysql -h <RDS_Instance_endpoint>:3306 -u sonardb -p 
```

8. Create a new sonar database
```sh
CREATE DATABASE sonar CHARACTER SET utf8 COLLATE utf8_general_ci;
```

9. Create a local and a remote user
```sh
CREATE USER sonar@localhost IDENTIFIED BY 'sonar';
CREATE USER sonar@'%' IDENTIFIED BY 'sonar';
```

10. Grant database access permissions to users 
```sh
GRANT ALL ON sonar.* TO sonar@localhost;
GRANT ALL ON sonar.* TO sonar@'%';
```

11. check users and databases 
```sh
use mysql
show databases;
SELECT User FROM mysql.user;
FLUSH PRIVILEGES;
QUIT
```
###       ------ On EC2 Instance ------

12. edit SonarQube properties file 
```sh
# vi /opt/sonar/conf/sonar.properties
sonar.jdbc.username=sonar
sonar.jdbc.password=sonar
mysql://<MySQL_Database_Server>:3306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useConfigs=maxPerformance&useSSL=false
sonar.web.host=0.0.0.0
sonar.web.context=/sonar

```

13. Start SonarQube service 
```sh
# cd /opt/sonar/bin/linux-x86-64/
# ./sonar.sh start
```

##### Optional 

14. Implement SonarQube server as a service
```sh
Copy sonar.sh to etc/init.d/sonar and modify it according to your platform.
# sudo cp /opt/sonar/bin/linux-x86-64/sonar.sh /etc/init.d/sonar
# sudo vi /etc/init.d/sonar
```

15. add below values to your /etc/init.d/sonar file
```sh
Insert/modify below values
SONAR_HOME=/opt/sonar
PLATFORM=linux-x86-64

WRAPPER_CMD="${SONAR_HOME}/bin/${PLATFORM}/wrapper"
WRAPPER_CONF="${SONAR_HOME}/conf/wrapper.conf"
PIDDIR="/var/run"
```

16. Run SonarQube server
```sh
# service sonar start
```

###  Troubleshooting 

1. Check whether you enabled port 9000 in EC2 instance security group
2. Check whether you enabled EC2 instance IP range in RDS security group
