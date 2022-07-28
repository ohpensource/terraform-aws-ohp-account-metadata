module "metadata" {
  count     = var.metadata.enable ? 1 : 0
  source    = "./metadata"
  providers = {
    aws.account = aws.account
    aws.organization = aws.organization
  }
}

output "metadata" {
  value = try(module.metadata[0].metadata, null)
}

output "client" {
  value = try(module.metadata[0].metadata["client"], null)
}

output "stage" {
  value = try(module.metadata[0].metadata["stage"], null)
}

output "alias" {
  value = try(module.metadata[0].alias, null)
}

output "id" {
  value = try(module.metadata[0].id, null)
}

output "name" {
  value = try(module.metadata[0].name, null)
}