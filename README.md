# terraform-aws-ohp-account-metadata

Terraform module to retrieve AWS account metadata

- [Introduction](#introduction)

## Introduction

This module allows you to centralize all (meta)data related to the AWS account you are deploying to. This project seeks to abstract the available metadata into one module that lets you deploy a terraform configuration by providing your AWS account id as input.

All metadata will be exposed in a map that can be consumed in your terraform configuration.

## TODO: Exposed metadata

## TODO: Examples


## Baselines
### Current situation
- Developers/Cloud Engineering must manually input resource IDs, ARNs, names into tfvars
- SSM parameters, data, secrets as possible sources of information

### Solution
- Module that will expose baseline resources
  - VPC
  - subnets
  - domains
  - ECS clusters
  - ...
- User defines what he wants, doesn't see how he gets it
  - Module gets the information (data, ssm, secret...) and provides it as output

### Comparison
#### Variables
Values must be inputted by responsible person - requires manual work, lengthier config files.
```hcl
variable "vpc_id" {
  type = "String"
  default = "vpc-123456"
}
variable "hosted_zone_id" {
  type = "String"
  default = "ZQJSDFSFOPJIW"
}

resource "aws_subnet" {
  vpc_id = var.vpc_id
}
resource "aws_route53_record" "" {
  ...
  zone_id = "var.hosted_zone_id"
}
```
#### Data
Data can take unified inputs, doesn't require search for values.
Data must be created per resource. Same goes for SSM, secrets etc.
```hcl
data "aws_vpc" "vpc" {
  tags = {
    Stage = var.stage
    Deployment = var.deployment
  }
}
data "aws_route53_zone" "zone" {
  tags = {
    Stage = var.stage
    Deployment = var.deployment
  }
}

resource "aws_subnet" {
  vpc_id = data.vpc.id
}
resource "aws_route53_record" "" {
  ...
  zone_id = "data.zone.id"
}
```

#### Output module
One module definition in the code.
Module retrieves value in the background - from data, SSM, secret etc.
Code auto-completion possible.

```hcl
module "account_metadata" {
  stage = var.stage
  deployment = var.deployment
}

resource "aws_subnet" {
  vpc_id = module.account_metadata.vpc_id
}
resource "aws_route53_record" "" {
  ...
  zone_id = module.account_metadata.route53_zone_id
}
```

### Prerequisites
- One stage and deployment cannot have two resources of the same kind
- Unified naming of resources
  - SSM
    - prefix /stage/deployment
  - Secret
    - ???
  - Tags
    - Stage
    - Deployment
- Recommended that consuming modules also have backup variables that can override value provided by module,  
e.g. ```try(var.vpc_id, output_module.outputs.vpc_id)```
- Some baselines can be deployed once per account, some once per stage, some once per deployment. Outputs module must control for which resources inputted stage and deployment can be overridden to get the correct resource.
- Backwards compatibility must be ensured

### Module inputs
Our accounts are client-specific. The two distinguishing attributes for retrieving the correct information are
**stage** and **deployment**.

| Variable   | Description                                      | Required | Default |
|------------|--------------------------------------------------|----------|---------|
| stage      | Stage of the resources - e.g. dev, tst, acc, prd | yes      | N/A     |
| deployment | Deployment in a stage - e.g. main, a, b, c       | no       | main    |
