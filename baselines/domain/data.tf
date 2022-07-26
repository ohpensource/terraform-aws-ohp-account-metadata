data "aws_ssm_parameter" "route53_public_domain_name" {
  name = "/${stage}/${deployment}/public-domain"
}