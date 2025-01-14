######################## Requests Certificates ##############
resource "aws_acm_certificate" "cert" {
  domain_name       = "tesraa.com"
  validation_method = "DNS"
  subject_alternative_names = ["www.tesraa.com"]

  tags = {
    Environment = "Session-6"
  }

  lifecycle {
    create_before_destroy = true
  }
}

################### Pushes to route53 ########
resource "aws_route53_record" "api_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = "Z08799971LBLCIEL9MZ3L"
}


################ Record for Load balancer


data "aws_route53_zone" "tesraacom" {
  name = "tesraa.com" # 
}

resource "aws_route53_record" "alias_record" {
  zone_id = data.aws_route53_zone.tesraacom.zone_id
  name    = "tesraa.com"
  type    = "A"

  alias {
    name                   = module.alb_asg.alb-dns
    zone_id                = module.alb_asg.alb_zone_id
    evaluate_target_health = true
  }
}