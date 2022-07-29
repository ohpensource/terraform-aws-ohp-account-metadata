module "metadata" {
  count     = var.metadata.enable ? 1 : 0
  source    = "./metadata"
}

output "metadata" {
  description = "Metadata object"
  value       = try(module.metadata[0].metadata, null)
}

output "client" {
  description = "Client"
  value       = try(module.metadata[0].metadata["client"], null)
}

output "stage" {
  description = "Stage"
  value       = try(module.metadata[0].metadata["stage"], null)
}

output "account_alias" {
  description = "Account alias"
  value       = try(module.metadata[0].account_alias, null)
}

output "account_id" {
  description = "Account ID"
  value       = try(module.metadata[0].account_id, null)
}

output "account_name" {
  description = "Account name as visible in organization"
  value       = try(module.metadata[0].account_name, null)
}