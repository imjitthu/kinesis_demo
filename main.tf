# Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    # docker = {
    #   source  = "kreuzwerker/docker"
    #   version = "~> 2.20.0"
    # }
  }
}

#S3 backend
terraform {
  backend "s3" {
    bucket = "jithendar"
    key    = "tf_statefiles/kinesis_demo/demo.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  #   access_key = var.aws_access_key
  #   secret_key = var.aws_secret_key
}