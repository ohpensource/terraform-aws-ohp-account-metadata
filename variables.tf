variable "aws_account_id" {
  type        = string
  description = "The id of the aws account we want to extract the metadata from."
}

variable "stage" {
  type        = string
  description = "Stage of the outputs, e.g. dev, tst, acc, prd"
}

variable "deployment" {
  type        = string
  default     = "main"
  description = "Deployment of the resource, e.g. main, b, c, d"
}

variable "network" {
  description = "Return outputs from network baseline"
  default     = {
    enable     = true
    stage      = null
    deployment = null
  }
}

variable "ecs" {
  description = "Return outputs from ECS baseline"
  default     = {
    enable     = true
    stage      = null
    deployment = null
  }
}

variable "cloudmap" {
  description = "Return outputs from CloudMap baseline"
  default     = {
    enable     = true
    stage      = null
    deployment = null
  }
}



