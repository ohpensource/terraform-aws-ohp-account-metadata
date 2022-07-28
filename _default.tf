locals {
  default = {
    enable     = try(var.default.enable, false)
    stage      = coalesce(try(var.default.stage, var.stage), try(module.metadata[0].stage, null))
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
  }
}