locals {
  output_metadata = merge(local.main_ssm_metadata, local.secondary_ssm_metadata)
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
