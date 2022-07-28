#variable "aws_account_id" {
#  type        = string
#  description = "The id of the aws account we want to extract the metadata from."
#}

variable "metadata" {
  description = "Enable account metadata outputs, e.g. stage, client, account name). Enabled by default."
  default = {
    enable = true
  }
}

variable "stage" {
  type        = string
  description = "Stage of the outputs, e.g. dev, tst, acc, prd. Set to override stage provided by metadata or if metadata.enable is false."
  default     = null
}

variable "default" {
  description = "Enable outputs from default baseline. Override default stage and deployment if necessary."
  default     = {
    enable     = false
    stage      = null
    deployment = null
  }
}

variable "domain" {
  description = "Enable outputs from domain baseline. Override default stage and deployment if necessary."
  default     = {
    enable     = false
    stage      = null
    deployment = null
  }
}

variable "network" {
  description = "Enable outputs from network baseline. Override default stage and deployment if necessary."
  default     = {
    enable     = false
    stage      = null
    deployment = null
  }
}

variable "ecs" {
  description = "Enable outputs from ECS baseline. Override default stage and deployment if necessary."
  default     = {
    enable     = false
    stage      = null
    deployment = null
  }
}

variable "cloudmap" {
  description = "Enable outputs from CloudMap baseline. Override default stage and deployment if necessary."
  default     = {
    enable     = false
    stage      = null
    deployment = null
  }
}