locals {
  main_metadata = {
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
    account_name = {
      exposed_via = local.ssm
      configuration = {
        ssm_parameter_name = "/account-metadata/account-name"
      }
    }
  }
  ssm              = "ssm"
  main_ssm_keys    = compact([for k, v in local.main_metadata : v.exposed_via == local.ssm ? k : ""])
  main_ssm_configs = [for k in local.main_ssm_keys : local.main_metadata[k].configuration]
  main_ssm_map     = zipmap(local.main_ssm_keys, local.main_ssm_configs)
}

data "aws_ssm_parameter" "main" {
  for_each = local.main_ssm_map
  name     = each.value.ssm_parameter_name
}

locals {
  main_ssm_values = [for k in local.main_ssm_keys : data.aws_ssm_parameter.main[k].value]
  main_ssm        = zipmap(local.main_ssm_keys, local.main_ssm_values)
}
