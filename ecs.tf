locals {
  ecs = {
    enable     = try(var.ecs.enable, true)
    stage      = try(coalesce(var.ecs.stage, var.stage), var.stage)
    deployment = try(coalesce(var.ecs.deployment, var.deployment), var.deployment)
  }
}

module "ecs" {
  count      = local.ecs.enable ? 1 : 0
  source     = "./modules/ecs"
  stage      = local.ecs.stage
  deployment = local.ecs.deployment
}