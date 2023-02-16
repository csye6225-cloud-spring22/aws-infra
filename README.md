# aws-infra

## Creating AWS Infrastructure using Terraform

### Table of Contents

- Prerequisites
- Terraform Initialize and Apply

### Prerequisites

## AWS CLI

- Install the latest AWS CLI v2. Kindly visit [AWS CLI Website](https://aws.amazon.com/cli/) for installation instructions
- After installation, please run the following command to check whether the aws cli is working
  - `aws --version`
- If successfully installed, please acquire the security credentials from AWS IAM. You will be able to set the profile using
  - `aws configure --profile <profile-name>`

## Terraform

- Terraform is the IaaC tool offered by Hashicorp. Kindly visit [Terraform](https://www.terraform.io/) for details
- Download and install the [Terraform CLI](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform)
- Check whether you have correctly installed Terraform by running follwing command
  - `terraform -version`

### Implementing the Infrastructure using Terraform

- Clone the repository
- Initialize the Terraform repository using the following command
  - `terraform init`
- In this repository, the default region and default profile is given as "us-east-1" and "dev" , if you wish to give other values, confirm that you create and initialize the variables inside the *.tfvars* file
- In order to see if there are any syntax errors and checking which services will be added, run the following command
  - `terraform plan`
- Now, in order to implement it to AWS, Run the following command. Adding --auto-approve tag will disable asking for the confirmation prompt
  - `terraform apply --auto-approve`

- In order to remove the resources from AWS, please run the following command
  - `terraform destroy --auto-approve`
- It is advisable to create a file as (file-name).tfvars and initialize the variables inside it. In order to include this tfvar file while applying the resources, please add --var-file="<(fileName)>.tfvars". Refer to following commands for apply and destroy
   - `terraform apply --auto-approve -var-file="<fileName>.tfvars"`
   - `terraform destroy --auto-approve -var-file="<fileName>.tfvars"`