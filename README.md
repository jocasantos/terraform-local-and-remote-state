# Terraform Local and Remote State Setup

This project demonstrates how to set up and use Terraform with both local and remote state storage.

## Getting Started

### Prerequisites

- Internet connection to download Terraform
- AWS account

### Installation

1. **Install Terraform on Linux:**

   Go to https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli and follow the instructions for your Linux distribution.

2. **Create the directories**

   ```bash
   mkdir aws && cd "$_" && mkdir local_state remote_state

## Setting Terraform with a Local State

Follow these steps to set up Terraform with a local state file:

1. **Initialize Terraform:**

   Navigate to your Terraform configuration directory (local_state), create the `main.tf` file and copy the inside from this repo. Then run:
   ```bash
   terraform init
   ```

2. **Dry-Run:**

   To see the changes before apply, run :
   ```bash
   terraform plan
   ```   

3. **Apply Configuration:**

   To apply your Terraform configuration and store the state locally, use:
   ```bash
   terraform apply
   ```

   This will create a `terraform.tfstate` file in your current directory, which contains the state of your infrastructure.



## Setting Terraform with a Remote State (S3 Bucket and DynamoDB)

To set up Terraform with a remote state stored in an Amazon S3 bucket enhanced by DynamoDB (locking feature), follow these steps:

1. **Create S3 Bucket and DynamoDB Table:**

   - Use Terraform to create the S3 bucket and DynamoDB table. Define the resources in a module.
   - Create the directories needed and copy the data from this repo.

   ```plaintext
   TERRAFORM-LOCAL-AND-REMOTE-STATE/
   ├── aws/
   │   ├── local_state/
   │   │   ├── main.tf
   │   ├── remote_state/
   │   │   ├── main.tf
   │   │   ├── modules/
   │   │   │   ├── s3_dynamodb/
   │   │   │   │   ├── main.tf
   │   │   │   │   ├── outputs.tf
   ├── .gitignore
   └── README.md

   > Change the bucket-id with your account-id

   - Go to s3_dynamodb directory 
   ```bash
   cd ../remote_state/modules/s3_dynamodb
   ```
   - Run the following command to initialize, plan and apply the backend configuration:

   ```bash
   terraform init
   ```
   ```bash
   terraform plan
   ```
   ```bash
   terraform apply
   ```
   - Congrats, you created a s3 bucket and a dynamoDB table.


2. **Setting Terraform with a Remote State:**

   - Go to remote_state directory 
   ```bash
   cd ../..
   ```
   - Run the following command to initialize, plan and apply your main configuration:
   ```bash
   terraform init
   ```
   ```bash
   terraform plan
   ```
   ```bash
   terraform apply
   ```

   The state will be stored in the specified S3 bucket instead of locally with the locking feature 🎉🎉.

> We didn't use `varaibles.tf` files but you should if you want to follow best practices on Terraform. https://github.com/ozbillwang/terraform-best-practices?tab=readme-ov-file#enable-version-control-on-terraform-state-files-bucket