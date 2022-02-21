# Description

 This module creates bastion host with TrustedCA Authorization wich allow to ssh via sigined certificates

## Module minimal usage:

    module "bastion" {
      source        = "git@gihthub.com:thunderbird86/tf-aws-ca-bastion?ref=v1.0.0"
      ca_public_key = var.ca_public_key
      subnet_id     = var.subnet_id
      vpc_id        = var.vpc_id
    }

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.0.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>3.39.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~>3.39.0 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_ami.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [template_cloudinit_config.this](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/cloudinit_config) | data source |
| [template_file.runcmd](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.sshd](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_public_access"></a> [allow\_public\_access](#input\_allow\_public\_access) | n/a | `bool` | `false` | no |
| <a name="input_ami_account_id"></a> [ami\_account\_id](#input\_ami\_account\_id) | The AWS account ID: Default is Canonical Group Limited | `string` | `"099720109477"` | no |
| <a name="input_ami_filter_arch"></a> [ami\_filter\_arch](#input\_ami\_filter\_arch) | Specifies the architecure of the AMI | `string` | `"x86_64"` | no |
| <a name="input_ami_filter_name"></a> [ami\_filter\_name](#input\_ami\_filter\_name) | The name of the AMI | `string` | `"ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20190212.1"` | no |
| <a name="input_ca_public_key"></a> [ca\_public\_key](#input\_ca\_public\_key) | Public part of lambda\_bless ssh key | `any` | n/a | yes |
| <a name="input_cas_file_path"></a> [cas\_file\_path](#input\_cas\_file\_path) | File to store public ssh key | `string` | `"/etc/ssh/cas.pub"` | no |
| <a name="input_cidr_blocks"></a> [cidr\_blocks](#input\_cidr\_blocks) | n/a | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Default instance type to launch | `string` | `"t3.small"` | no |
| <a name="input_name"></a> [name](#input\_name) | Lower DNS domain name | `string` | `"bastion"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of additional security groups to attach | `list(string)` | `[]` | no |
| <a name="input_ssh_port"></a> [ssh\_port](#input\_ssh\_port) | n/a | `number` | `22` | no |
| <a name="input_sshd_conf_path"></a> [sshd\_conf\_path](#input\_sshd\_conf\_path) | Path to sshd configuration file | `string` | `"/etc/ssh/sshd_config"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID define where lauch bastion | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID where to create Security Group | `any` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | Zone ID to create DNS record | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eip"></a> [eip](#output\_eip) | n/a |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | FQDN of bastion host |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

