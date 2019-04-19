resource "aws_security_group" "this" {
  description = "Default ${var.name} security group"
  name_prefix = "${var.name}-"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(var.tags, map("Name", var.name))}"
}

resource "aws_security_group_rule" "internal" {
  security_group_id = "${aws_security_group.this.id}"
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  self              = true
}

resource "aws_security_group_rule" "ssh" {
  count = "${var.allow_public_access ? 1 : 0}"

  security_group_id = "${aws_security_group.this.id}"
  type              = "ingress"
  to_port           = "${var.ssh_port}"
  from_port         = "${var.ssh_port}"
  protocol          = "TCP"
  cidr_blocks       = "${var.cidr_blocks}"
}

resource "aws_security_group_rule" "egress" {
  security_group_id = "${aws_security_group.this.id}"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
}
