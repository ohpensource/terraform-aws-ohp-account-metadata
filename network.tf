locals {
  network = {
    enable     = try(var.network.enable, true)
    stage      = try(coalesce(var.network.stage, var.stage), var.stage)
    deployment = try(coalesce(var.network.deployment, var.deployment), var.deployment)
  }
}

module "network" {
  count      = local.network.enable ? 1 : 0
  source     = "./modules/network"
  stage      = local.network.stage
  deployment = local.network.deployment
}