module "account_metadata" {
  source = "../../terraform-aws-ohp-account-metadata"

  metadata = {
    enable = try(var.account_metadata, true) # Set value in tfvars to override
  }

  stage = try(var.account_metadata.stage, null) # Set value in tfvars to override

  # Repeatable for other baselines
  cloudmap = {
    enable     = try(var.account_metadata.cloudmap.enable, false) # Set true in tfvars to enable
    stage      = try(var.account_metadata.cloudmap.stage, null) # Set value in tfvars to override
    deployment = try(var.account_metadata.cloudmap.deployment, null) # Set value in tfvars to override
  }
  network = {
    enable     = try(var.account_metadata.network.enable, false) # Set true in tfvars to enable
    stage      = try(var.account_metadata.network.stage, null) # Set value in tfvars to override
    deployment = try(var.account_metadata.network.deployment, null) # Set value in tfvars to override
  }
}