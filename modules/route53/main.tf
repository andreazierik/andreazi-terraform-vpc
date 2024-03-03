data "aws_route53_zone" "this" {
  name         = var.domain_name
  private_zone = false
}

resource "aws_route53_record" "app" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "aplicacao.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.alb-endpoint
    zone_id                = var.alb-zone-id
    evaluate_target_health = true
  }
}