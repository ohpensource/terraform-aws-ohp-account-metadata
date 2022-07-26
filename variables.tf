variable "aws_account_id" {
  type        = string
  description = "The id of the aws account we want to extract the metadata from."
}

variable "stage" {
  type        = string
  description = "Stage of the outputs, e.g. dev, tst, acc, prd"
  default     = null
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