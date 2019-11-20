# Ansible Dynamic Inventory

### Pre-requisites:
   1. Ansible Server - Get [Click here](https://www.youtube.com/watch?v=-Y8Oatd49qA) to install on RHEL 8 and [click here](https://www.youtube.com/watch?v=79xFyOc_eEY) to install on Amazon Linux
       

### Setup 

To get help on dynamic inventory please follow  [Ansible Official Document](https://docs.ansible.com/ansible/latest/user_guide/intro_dynamic_inventory.html#inventory-script-example-aws-ec2)

1. Download [ec2.py](https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py) and [ec2.ini](https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini) files

1. Create IAM Programmatic access user with EC2 full access on AWS console 

   `IAM` --> `users` --> `Add user` 

1. Export IAM user credentials on Ansible server. 

   ```bash
   export AWS_ACCESS_KEY_ID='1bc123'
   export AWS_SECRET_ACCESS_KEY='abc123'
   ```
1. To export keys permanently make sure that you have installed pip and boto and add credentials ~/.boto file

1. add executing permissions to ec2.py script
   ```sh
   chmod 755 ec2.py
   ```
1. test the script 
   ```
   ./ec2.py --list
   ```
1. List out servers which are running on ap-south-1a AZ
   ```
   ansible -i ec2.py  ap-south-1a --list-hosts
   ```
