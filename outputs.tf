locals {
  ssm_values      = [for k in local.ssm_keys : data.aws_ssm_parameter.main[k].value]
  output_metadata = zipmap(local.ssm_keys, local.ssm_values)
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
