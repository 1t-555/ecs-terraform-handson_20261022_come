terraform {
  required_version = ">= 1.11.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket       = "tfstate-1t-555-20261022" 
    key          = "ecs-handson/terraform.tfstate"
    region       = "ap-northeast-1"
    use_lockfile = true # Terraform 1.11+ の S3 ネイティブファイルロックを使用
  }
}

provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      Project = "ecs-terraform-handson"
    }
  }
}