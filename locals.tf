locals {
  stage      = try(module.default[0].stage, var.stage)
  deployment = "main"
}