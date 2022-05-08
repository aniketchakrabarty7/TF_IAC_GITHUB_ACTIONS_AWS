terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.12.1"
    }

  }
  backend "s3" {
    bucket = "tf-iac-aws-tfstate"
    key    = "tf-iac-aws-tfstate.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
