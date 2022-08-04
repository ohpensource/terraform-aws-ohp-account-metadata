data "aws_ssm_parameter" "route53_public_domain_name" {
  name = "/${var.stage}/${var.deployment}/public-domain"
}