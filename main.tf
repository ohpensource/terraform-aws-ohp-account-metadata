locals {
  ssm = "ssm"
  metadata = {
    client = {
      exposed_via = local.ssm
      configuration = {
        ssm_parameter_name = "/account-metadata/client"
      }
    }
    stage = {
      exposed_via = local.ssm
      configuration = {
        ssm_parameter_name = "/account-metadata/stage"
      }
    }
  }
  ssm_keys     = compact([for k, v in local.metadata : v.exposed_via == local.ssm ? k : ""])
  ssm_configs  = [for k in local.ssm_keys : local.metadata[k].configuration]
  ssm_metadata = zipmap(local.ssm_keys, local.ssm_configs)
}

data "aws_ssm_parameter" "main" {
  for_each = local.ssm_metadata
  name     = each.value.ssm_parameter_name
}
