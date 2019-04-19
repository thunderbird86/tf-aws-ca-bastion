# Description

 This module creates bastion host with TrustedCA Authorization wich allow to ssh via sigined certificates

## Module minimal usage:

    module "bastion" {
      source = "git::ssh://git@bitbucket.upc.biz:7999/terra/tf-bastion.git?ref=develop"

      subnet_id = "${var.subnet_id}"
      ssh_pub   = "${var.ssh_pub}"
    }

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ca\_public\_key | Public part of lambda_bless ssh key | string | n/a | yes |
| subnet\_id | Subnet ID define where lauch bastion | string | n/a | yes |
| vpc\_id |  | string | n/a | yes |
| allow\_public\_access |  | string | `"false"` | no |
| ami\_account\_id | The AWS account ID: Default is Canonical Group Limited | string | `"099720109477"` | no |
| ami\_filter\_arch | Specifies the architecure of the AMI | string | `"x86_64"` | no |
| ami\_filter\_name | The name of the AMI | string | `"ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20190212.1"` | no |
| cas\_file\_path | File to store public ssh key | string | `"/etc/ssh/cas.pub"` | no |
| cidr\_blocks |  | list | `[ "0.0.0.0/0" ]` | no |
| instance\_type | Default instance type to launch | string | `"t3.small"` | no |
| name | Lower DNS domain name | string | `"bastion"` | no |
| security\_group\_ids | List of additional security groups to attach | list | `[]` | no |
| ssh\_port |  | string | `"22"` | no |
| sshd\_conf\_path | Path to sshd configuration file | string | `"/etc/ssh/sshd_config"` | no |
| tags | Additional tags | map | `{}` | no |
| zone\_id | Zone ID to create DNS record | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| eip |  |
| fqdn | FQDN of bastion host |

