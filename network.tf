locals {
  network = {
    enable     = try(var.network.enable, true)
    stage      = coalesce(try(var.network.stage, var.stage), var.stage)
    deployment = coalesce(try(var.network.deployment, local.deployment), local.deployment) # Use main unless overridden by baseline-specific variable
  }
}

module "network" {
  count      = local.network.enable ? 1 : 0
  source     = "./modules/network"
  stage      = local.network.stage
  deployment = local.network.deployment
}