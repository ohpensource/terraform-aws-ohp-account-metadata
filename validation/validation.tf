provider "aws" {
  alias = "account"
}
provider "aws" {
  alias = "organization"
}

module "account_metadata" {
  source = "../../terraform-aws-ohp-account-metadata"

  aws_account_id = ""

  providers = {
    aws.account = aws.account
    aws.organization = aws.organization
  }
}