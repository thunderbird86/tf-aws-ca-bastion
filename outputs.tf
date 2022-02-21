output "fqdn" {
  description = "FQDN of bastion host"
  value       = join("", aws_route53_record.this.*.fqdn)
}

output "eip" {
  description = ""
  value       = aws_eip.this.public_ip
}
