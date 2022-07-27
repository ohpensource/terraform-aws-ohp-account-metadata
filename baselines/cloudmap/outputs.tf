output "cloudmap_namespace_id" {
  value = data.aws_ssm_parameter.cloudmap_namespace_id.value
}

output "cloudmap_namespace_arn" {
  value = data.aws_ssm_parameter.cloudmap_namespace_arn.value
}

output "cloudmap_namespace_name" {
  value = data.aws_ssm_parameter.cloudmap_namespace_name.value
}

output "cloudmap_read_only_policy_arn" {
  value = data.aws_ssm_parameter.cloudmap_read_only_policy_arn.value
}

output "cloudmap_read_write_policy_arn" {
  value = data.aws_ssm_parameter.cloudmap_read_write_policy_arn.value
}