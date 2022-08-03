locals {
  secondary_metadata = {
    public_domain = {
      exposed_via = local.ssm
      configuration = {
        ssm_parameter_name = "/${local.main_ssm["stage"]}/main/public-domain"
      }
    }
  }
  secondary_ssm_keys    = compact([for k, v in local.secondary_metadata : v.exposed_via == local.ssm ? k : ""])
  secondary_ssm_configs = [for k in local.secondary_ssm_keys : local.secondary_metadata[k].configuration]
  secondary_ssm_map     = zipmap(local.secondary_ssm_keys, local.secondary_ssm_configs)
}

data "aws_ssm_parameter" "secondary" {
  for_each = local.secondary_ssm_map
  name     = each.value.ssm_parameter_name
}

locals {
  secondary_ssm_values = [for k in local.secondary_ssm_keys : data.aws_ssm_parameter.secondary[k].value]
  secondary_ssm        = zipmap(local.secondary_ssm_keys, local.secondary_ssm_values)
}
