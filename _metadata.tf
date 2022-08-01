module "metadata" {
  count     = var.metadata.enable ? 1 : 0
  source    = "./metadata"
}

output "metadata" {
  description = "metadata - Metadata object"
  value       = try(module.metadata[0].metadata, null)
}

output "client" {
  description = "metadata - Client"
  value       = try(module.metadata[0].client, null)
}

output "stage" {
  description = "metadata - Stage"
  value       = try(module.metadata[0].stage, null)
}

output "account_alias" {
  description = "metadata - Account alias"
  value       = try(module.metadata[0].account_alias, null)
}

output "account_id" {
  description = "metadata - Account ID"
  value       = try(module.metadata[0].account_id, null)
}

output "account_name" {
  description = "metadata - Account name as visible in organization"
  value       = try(module.metadata[0].account_name, null)
}