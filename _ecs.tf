locals {
  ecs = {
    enable     = try(var.ecs.enable, false)
    stage      = coalesce(try(var.ecs.stage, var.stage), try(module.metadata[0].stage, null))
    deployment = coalesce(try(var.ecs.deployment, local.deployment), local.deployment) # Use main unless overridden by baseline-specific variable
  }
}

module "ecs" {
  count      = local.ecs.enable ? 1 : 0
  source     = "./baselines/ecs"
  stage      = local.ecs.stage
  deployment = local.ecs.deployment
}