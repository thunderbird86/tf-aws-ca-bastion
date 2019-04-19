#Required
variable "ca_public_key" {
  description = "Public part of lambda_bless ssh key"
}

variable "vpc_id" {}

variable "subnet_id" {
  description = "Subnet ID define where lauch bastion"
}

#Optional
variable "security_group_ids" {
  description = "List of additional security groups to attach"
  type        = "list"
  default     = []
}

variable "zone_id" {
  description = "Zone ID to create DNS record"
  default     = ""
}

variable "tags" {
  description = "Additional tags"
  type        = "map"
  default     = {}
}

variable "instance_type" {
  description = "Default instance type to launch"
  default     = "t3.small"
}

variable "cas_file_path" {
  description = "File to store public ssh key"
  default     = "/etc/ssh/cas.pub"
}

variable "sshd_conf_path" {
  description = "Path to sshd configuration file"
  default     = "/etc/ssh/sshd_config"
}

variable "name" {
  description = "Lower DNS domain name"
  default     = "bastion"
}

variable "ami_account_id" {
  description = "The AWS account ID: Default is Canonical Group Limited"
  default     = "099720109477"
}

variable "ami_filter_name" {
  description = "The name of the AMI"
  default     = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20190212.1"
}

variable "ami_filter_arch" {
  description = "Specifies the architecure of the AMI"
  default     = "x86_64"
}

variable "allow_public_access" {
  default = false
}

variable "ssh_port" {
  default = 22
}

variable "cidr_blocks" {
  description = ""
  type        = "list"

  default = [
    "0.0.0.0/0",
  ]
}
