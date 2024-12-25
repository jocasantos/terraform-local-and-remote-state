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

2. **Apply Configuration:**

   To apply your Terraform configuration and store the state locally, use:
   ```bash
   terraform apply
   ```

   This will create a `terraform.tfstate` file in your current directory, which contains the state of your infrastructure.



## Setting Terraform with a Remote State (S3 Bucket)

To set up Terraform with a remote state stored in an Amazon S3 bucket, follow these steps:

1. **Configure Backend:**

   In your Terraform configuration file, specify the S3 backend:
   ```hcl
   terraform {
     backend "s3" {
       bucket         = "your-s3-bucket-name"
       key            = "path/to/your/key"
       region         = "your-region"
     }
   }
   ```

2. **Initialize Terraform:**

   Run the following command to initialize the backend configuration:
   ```bash
   terraform init
   ```

3. **Apply Configuration:**

   Apply your Terraform configuration:
   ```bash
   terraform apply
   ```

   The state will be stored in the specified S3 bucket instead of locally.

## Conclusion

asdasdas