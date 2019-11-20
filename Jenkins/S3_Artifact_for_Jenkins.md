
#  S3 as a artifact for Jenkins

Follow this in  **[YouTube](https://youtu.be/GQZYpIRxi-g)**

### Prerequisites
1. Create Jenkins Server
  Jenkins server **[Get Help here](https://www.youtube.com/watch?v=M32O4Yv0ANc)**

   ### Setup steps 
1. Create a S3 bucket to store artifacts  
    `S3 --> Create bucket `
      ```sh 
   Bucket name: valaxy-s3-artifact 
   Region: Singapore
   ```
1. Create new IAM role with "S3 full access" and assign it to jenkins server  
   `IAM --> Create role --> EC2` 
   ```ssh 
   Permission: AmazonS3FullAccess 
   Tags: key - Name, Value - S3FullAccess Role 
   name: S3_Full_Access
   ```
   
1. Install "S3 Publisher" plugin on Jenkins  
  `Manage Jenkins --> Manage Plugins --> Availabe --> S3 publisher`

1. Configure S3 profile on Jenkins  
  `Manage Jenkins --> Configure Systems --> Amazon S3 profiles` 
   ```sh
   Profile name : s3-artifact-repository 
   Use IAM Role : chose
   ```

1. Create a job to store artifacts under S3.
