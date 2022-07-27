locals {
  cloudmap = {
    enable     = try(var.cloudmap.enable, false)
    stage      = coalesce(try(var.cloudmap.stage, var.stage), local.stage)
    deployment = coalesce(try(var.cloudmap.deployment, local.deployment), local.deployment) # Use main unless overridden by baseline-specific variable
  }
}

module "cloudmap" {
  count      = local.cloudmap.enable ? 1 : 0
  source     = "./baselines/cloudmap"
  stage      = local.cloudmap.stage
  deployment = local.cloudmap.deployment
  providers = {
    aws = aws.account
  }
}

output "cloudmap_namespace_id" {
  description = "CloudMap namespace ID"
  value       = try(module.cloudmap[0].cloudmap_namespace_id, null)
  sensitive   = true
}

output "cloudmap_namespace_arn" {
  description = "CloudMap namespace ARN"
  value       = try(module.cloudmap[0].cloudmap_namespace_arn, null)
}

output "cloudmap_namespace_name" {
  description = "CloudMap namespace name"
  value       = try(module.cloudmap[0].cloudmap_namespace_name, null)
}

output "cloudmap_read_only_policy_arn" {
  description = "CloudMap read-only IAM policy ARN"
  value       = try(module.cloudmap[0].cloudmap_read_only_policy_arn, null)
}

output "cloudmap_read_write_policy_arn" {
  description = "CloudMap read-write IAM policy ARN"
  value       = try(module.cloudmap[0].cloudmap_read_write_policy_arn, null)
}