
## SonarQube Integration with Jenkins

1. Login to jenkins server and install sonarqube scanner. 

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

