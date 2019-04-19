resource "aws_route53_record" "this" {
  count   = "${var.zone_id != "" ? 1 : 0}"
  name    = "${var.name}"
  type    = "A"
  ttl     = 300
  zone_id = "${var.zone_id}"

  records = [
    "${aws_eip.this.public_ip}",
  ]
}
