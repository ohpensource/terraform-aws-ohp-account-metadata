terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.account, aws.organization]
    }
  }
}

provider "aws" {
  alias = "account"
}

provider "aws" {
  alias = "organization"
}