data "aws_iam_account_alias" "main" {
  provider = aws.account
}

locals {
  account_alias = data.aws_iam_account_alias.main.account_alias
}
