terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {
    bucket         = "<account-id>-terraform-states"
    key            = "demo.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-lock"
    encrypt = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-north-1" # Change to your preferred region
}

resource "aws_instance" "example_server" {
  ami           = "ami-075449515af5df0d1"  # Change to a valid AMI ID for your region
  instance_type = "t3.micro"

  tags = {
    Name = "TerraformDemo"
  }
}
