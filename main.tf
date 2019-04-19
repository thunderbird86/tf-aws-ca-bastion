/**
  * # Description
  *
  *  This module creates bastion host with TrustedCA Authorization wich allow to ssh via sigined certificates
  *
  * ## Module minimal usage:
  *
  *     module "bastion" {
  *       source = "git::ssh://git@bitbucket.upc.biz:7999/terra/tf-bastion.git?ref=develop"
  *
  *       subnet_id = "${var.subnet_id}"
  *       ssh_pub   = "${var.ssh_pub}"
  *     }
  */

resource "aws_instance" "this" {
  ami                    = "${data.aws_ami.selected.id}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.security_group_ids}", "${aws_security_group.this.id}"]
  user_data              = "${data.template_cloudinit_config.this.rendered}"

  tags = "${merge(var.tags, map("Name", var.name))}"
}

resource "aws_eip" "this" {
  instance = "${aws_instance.this.id}"
  vpc      = true

  tags = "${merge(var.tags, map("Name", var.name))}"
}
