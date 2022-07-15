locals {
  output_metadata = merge(local.main_ssm,
    local.secondary_ssm,
    { name = local.account_name },
    { alias = local.account_alias },
  { id = var.aws_account_id })
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

output "public_domain" {
  value = local.output_metadata["public_domain"]
}

output "alias" {
  value = local.account_alias
}

output "id" {
  value = var.aws_account_id
}

output "name" {
  value = local.account_name
}
