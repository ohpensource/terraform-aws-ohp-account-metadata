locals {
  output_metadata = merge(local.main_ssm,
    local.secondary_ssm,
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

output "public_domain" {
  value = local.output_metadata["public_domain"]
}

output "alias" {
  value = local.account_alias
}

output "id" {
  value = data.aws_caller_identity.current.account_id
}

output "name" {
  value = local.output_metadata["account_name"]
}
