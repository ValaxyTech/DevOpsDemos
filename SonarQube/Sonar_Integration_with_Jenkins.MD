
## SonarQube Integration with Jenkins


SonarQube Integration with Jenkins

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
# vi /opt/sonar_scanner/sonar-scanner.properties
sonar.host.url=http://<Sonarqube_server>:9000
```

2. Login to jenkins console and install "Sonarqube scanner" plugin

```sh 
  Manage Jenkins --> Manage Pluins --> Available --> Search for "Sonarqube scanner" --> Install with restart 
 ```
 
3. Configure sonarqube server name and authentication toaken 
```sh
   Manage Jenkins --> Configure Systems --> SonarQube Servers
    Name : SonarQube
	ServerURL : http://<Sonarqube_server>:9000/sonar
	Server authentication token  
	Login to sonarqube server as a admin  My Account --> Security --> Generate Token
```

4. Configure sonarqube scanner and path
```sh
   Manage Jenkins --> Global Tool Configuration --> SonarQube Scanner 
   Name  : Sonarqube
   SONAR_RUNNER_HOME : /opt/sonar
```

5. Create a job to test sonarqube. 
Provide below sonar property details under Build --> Execute SonarQube Scanner --> Analysis properties. it is mandatary.  

```sh
# Required paramateries 
Sonar.ProjectKey=valaxy
Sonar.ProjectName=ValaxyDemo
Sonar.ProjectVersion=1.0

#Artifactory directory
Sonar.Sources=/var/lib/jenkins/workspace/$JOB_NAME/webapp/src
```
6. Execute job to get analysis report. 

