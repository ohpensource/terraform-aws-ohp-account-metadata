# terraform-aws-ohp-account-metadata

Terraform module to retrieve AWS account metadata

- [Introduction](#introduction)

## Introduction

This module allows you to centralize all (meta)data related to the AWS account you are deploying to. This project seeks to abstract the available metadata into one module that lets you deploy a terraform configuration by providing your AWS account id as input.

All metadata will be exposed in a map that can be consumed in your terraform configuration.

## TODO: Exposed metadata

## TODO: Examples

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_account_alias.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_account_alias) | data source |
| [aws_ssm_parameter.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.secondary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alias"></a> [alias](#output\_alias) | n/a |
| <a name="output_client"></a> [client](#output\_client) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_metadata"></a> [metadata](#output\_metadata) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_public_domain"></a> [public\_domain](#output\_public\_domain) | n/a |
| <a name="output_stage"></a> [stage](#output\_stage) | n/a |
<!-- END_TF_DOCS -->