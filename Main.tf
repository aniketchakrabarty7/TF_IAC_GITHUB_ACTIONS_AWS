terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.12.1"
    }
    
  }
  backend "s3" {
    bucket ="tf-iac-aws-tfstate"
    key = "tf-iac-aws-tfstate.tfstate"
    region = "us-east-1"
   }
}

provider "aws" {
  # Configuration options
  profile = "default"
  region = "us-east-1"
}

locals {
    project_name = "tf-iac-aws"
}

resource "aws_instance" "tf-iac-test-server" {
    ami = "ami-0c02fb55956c7d316"
    instance_type = "t2.micro"
    
    tags = {
        Name = "test-server-${local.project_name}"
    }
}

output "instance_ip_addr"{
    value = aws_instance.tf-iac-test-server.public_ip
}