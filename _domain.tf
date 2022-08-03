locals {
  domain = {
    enable     = try(var.domain.enable, false)
    stage      = coalesce(try(var.domain.stage, null), try(var.stage, null), try(module.metadata[0].stage, null))
    deployment = coalesce(try(var.domain.deployment, local.deployment), local.deployment) # Use main unless overridden by baseline-specific variable
  }
}

module "domain" {
  count      = local.domain.enable ? 1 : 0
  source     = "./baselines/domain"
  stage      = local.domain.stage
  deployment = local.domain.deployment
}

output "route53_public_domain_name" {
  description = "domain - Route53 public domain name"
  value       = try(module.domain[0].route53_public_domain_name, null)
}