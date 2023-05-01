terraform {
  required_version = ">=1.1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    
    openapi3 = {
      source = "terraform-providers/openapi3"
      version = "1.0.0"
    }
     }
  
  }

provider "aws" {
  region = "us-east-1"
 }


