locals {
  cloudmap = {
    enable     = try(var.cloudmap.enable, true)
    stage      = try(coalesce(var.cloudmap.stage, var.stage), var.stage)
    deployment = try(coalesce(var.cloudmap.deployment, var.deployment), var.deployment)
  }
}

module "cloudmap" {
  count      = local.cloudmap.enable ? 1 : 0
  source     = "./modules/cloudmap"
  stage      = local.cloudmap.stage
  deployment = local.cloudmap.deployment
}

output "cloudmap_namespace_id" {
  description = "CloudMap namespace ID"
  value       = try(module.cloudmap[0].cloudmap_namespace_id, null)
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