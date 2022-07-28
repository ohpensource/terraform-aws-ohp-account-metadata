locals {
  default = {
    enable     = try(var.default.enable, false)
    stage      = coalesce(try(var.default.stage, var.stage), local.stage)
    deployment = coalesce(try(var.default.deployment, local.deployment), local.deployment) # Use main unless overridden by baseline-specific variable
  }
}

module "default" {
  count      = local.default.enable ? 1 : 0
  source     = "./baselines/default"
  stage      = local.default.stage
  deployment = local.default.deployment
  providers = {
    aws = aws.account
    aws.organization = aws.organization
  }
}

output "metadata" {
  value = try(module.default[0].metadata, null)
}

output "client" {
  value = try(module.default[0].metadata["client"], null)
}

output "stage" {
  value = try(module.default[0].metadata["stage"], null)
}

output "alias" {
  value = try(module.default[0].alias, null)
}

output "id" {
  value = try(module.default[0].id, null)
}

output "name" {
  value = try(module.default[0].name, null)
}