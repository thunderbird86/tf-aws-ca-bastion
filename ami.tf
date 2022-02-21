data "aws_ami" "selected" {
  owners      = [var.ami_account_id] //
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_filter_name]
  }

  filter {
    name   = "architecture"
    values = [var.ami_filter_arch]
  }
}
