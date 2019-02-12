
1. Create Jenkins Server 

2. Create a S3 bucket to store artifacts
  ```sh 
    S3 --> Create bucket 
  ```
  Bucket name: valaxy-s3-artifact
  Region: Singapore
 
  
3. Create new IAM role with "S3 full access" and assign it to jenkins server
   IAM --> Create role --> EC2 
   Permission:  AmazonS3FullAccess 
   Tags: key - Name, Value - S3FullAccess
   Role name: S3_Full_Access
   
4. Install "S3 Publisher" plugin on Jenkins 

   ` Manage Jenkins --> Manage Plugins --> availabe --> S3 publisher `
   
5. Create "Amazon S3 profiles" under Configure Systems
    ` Manage Jenkins --> Configure Systems --> Amazon S3 profiles`
	Profile name : s3-artifact-repository
	Use IAM Role : chose
	
6. Create a job to store artifacts under S3.

Validations:
 Go and check S3 bucket for artifact 
 
