output "route53_public_domain_name" {
  value = data.aws_ssm_parameter.route53_public_domain_name
}