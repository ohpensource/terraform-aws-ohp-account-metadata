locals {
  cloudmap = {
    enable     = try(var.cloudmap.enable, false)
    stage      = coalesce(try(var.cloudmap.stage, null), try(var.stage, null), try(module.metadata[0].stage, null))
    deployment = coalesce(try(var.cloudmap.deployment, local.deployment), local.deployment) # Use main unless overridden by baseline-specific variable
  }
}

module "cloudmap" {
  count      = local.cloudmap.enable ? 1 : 0
  source     = "./baselines/cloudmap"
  stage      = local.cloudmap.stage
  deployment = local.cloudmap.deployment
}

output "cloudmap_namespace_id" {
  description = "cloudmap - CloudMap namespace ID"
  value       = try(module.cloudmap[0].cloudmap_namespace_id, null)
}

output "cloudmap_namespace_arn" {
  description = "cloudmap - CloudMap namespace ARN"
  value       = try(module.cloudmap[0].cloudmap_namespace_arn, null)
}

output "cloudmap_namespace_name" {
  description = "cloudmap - CloudMap namespace name"
  value       = try(module.cloudmap[0].cloudmap_namespace_name, null)
}

output "cloudmap_read_only_policy_arn" {
  description = "cloudmap - CloudMap read-only IAM policy ARN"
  value       = try(module.cloudmap[0].cloudmap_read_only_policy_arn, null)
}

output "cloudmap_read_write_policy_arn" {
  description = "cloudmap - CloudMap read-write IAM policy ARN"
  value       = try(module.cloudmap[0].cloudmap_read_write_policy_arn, null)
}