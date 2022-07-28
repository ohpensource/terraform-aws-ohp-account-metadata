provider "aws" {
  alias = "account"
}
provider "aws" {
  alias = "organization"
}

module "account_metadata" {
  source = "../../terraform-aws-ohp-account-metadata"

  providers = {
    aws.account = aws.account
    aws.organization = aws.organization
  }
}