data "aws_ssm_parameter" "cloudmap_namespace_id" {
  name = "/${var.stage}/${var.deployment}/cloudmap/namespace/id"
}

data "aws_ssm_parameter" "cloudmap_namespace_arn" {
  name = "/${var.stage}/${var.deployment}/cloudmap/namespace/arn"
}

data "aws_ssm_parameter" "cloudmap_namespace_name" {
  name = "/${var.stage}/${var.deployment}/cloudmap/namespace/name"
}

data "aws_ssm_parameter" "cloudmap_read_only_policy_arn" {
  name = "/${var.stage}/${var.deployment}/cloudmap/iam/policy/readonly/arn"
}

data "aws_ssm_parameter" "cloudmap_read_write_policy_arn" {
  name = "/${var.stage}/${var.deployment}/cloudmap/iam/policy/readwrite/arn"
}
