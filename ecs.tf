locals {
  ecs = {
    enable     = try(var.ecs.enable, true)
    stage      = coalesce(try(var.ecs.stage, var.stage), var.stage)
    deployment = coalesce(try(var.ecs.deployment, local.deployment), local.deployment) # Use main unless overridden by baseline-specific variable
  }
}

module "ecs" {
  count      = local.ecs.enable ? 1 : 0
  source     = "./modules/ecs"
  stage      = local.ecs.stage
  deployment = local.ecs.deployment
}