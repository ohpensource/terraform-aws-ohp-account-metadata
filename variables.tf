variable "metadata" {
  description = "Enable account metadata outputs, e.g. stage, client, account name. Enabled by default."
  default = {
    enable = true
  }
}

variable "stage" {
  type        = string
  description = "Stage of the outputs, e.g. dev, tst, acc, prd. Set to override stage provided by metadata or if metadata.enable is false."
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
