data "aws_organizations_organization" "main" {
  provider = aws.organization
}

locals {
  accounts      = data.aws_organizations_organization.main.non_master_accounts
  account_names = [for account in local.accounts : account.id == var.aws_account_id ? account.name : ""]
  account_name  = coalesce(local.account_names...)
}
