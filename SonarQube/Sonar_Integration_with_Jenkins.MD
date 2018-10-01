
## SonarQube Integration with Jenkins

To integrate SonarQube with Jenkins we should install Sonar Scanner and sonarqube scanner plugin Jenkins. After that confingre SonarQube server and Sonar scanner under manage jenkins. 

1. Login to jenkins server and install sonarqube scanner. 

Sonarqube scanner URL : https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner

Downlaod : https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip
```sh 
# wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip
# unzip sonar-scanner-cli-3.2.0.1227-linux.zip
# mv sonar-scanner-3.2.0.1227-linux /opt/sonar_scanner 
```

2. Set sonarqube server details in sonar-scanner property file 
```sh 
# vi /opt/sonar_scanner/conf/sonar-scanner.properties
sonar.host.url=http://<Sonarqube_server>:9000
```

2. Login to jenkins console and install "Sonarqube scanner" plugin

```sh 
  Manage Jenkins --> Manage Plugins --> Available --> Search for "Sonarqube scanner" --> Install with restart 
 ```
3. Configure sonarqube scanner hope path path
```sh
   Manage Jenkins --> Global Tool Configuration --> SonarQube Scanner 
   Name  : sonar_scanner
   SONAR_RUNNER_HOME : /opt/sonar_scanner
```

4. Configure sonarqube server name and authentication toaken 
```sh
   Manage Jenkins --> Configure Systems --> SonarQube Servers
    Name : SonarQube
	ServerURL : http://<Sonarqube_server>:9000/sonar
	Server authentication token  
	Login to sonarqube server as a admin  My Account --> Security --> Generate Token
```

5. Create a job to test sonarqube. 
Provide below sonar property details under Build --> Execute SonarQube Scanner --> Analysis properties. it is mandatary.  

```sh
# Required paramateries 
sonar.projectKey=Valaxy
sonar.projectName=ValaxyDemo
sonar.projectVersion=1.0

#Artifactory directory
sonar.sources=/var/lib/jenkins/workspace/$JOB_NAME/SimpleCustomerApp/src
```
6. Execute job to get analysis report. 

