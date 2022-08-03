locals {
  output_metadata = merge(local.main_ssm,
    { alias = local.account_alias },
    { id = data.aws_caller_identity.current.account_id }
  )
}

output "metadata" {
  value = local.output_metadata
}

output "client" {
  value = local.output_metadata["client"]
}

output "stage" {
  value = local.output_metadata["stage"]
}

output "account_alias" {
  value = local.account_alias
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "account_name" {
  value = local.output_metadata["account_name"]
}