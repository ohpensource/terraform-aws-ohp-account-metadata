data "aws_iam_account_alias" "main" {}

locals {
  account_alias = data.aws_iam_account_alias.main.account_alias
}
