data "template_file" "sshd" {
  template = templatefile("${path.module}/user_data/10_sshd.yml",
    {
      cas_file_path  = var.cas_file_path
      ca_public_key  = var.ca_public_key
      sshd_conf_path = var.sshd_conf_path
      ssh_port       = var.ssh_port
    }
  )
}

data "template_file" "runcmd" {
  template = file("${path.module}/user_data/99_runcmd.yml")
}

data "template_cloudinit_config" "this" {
  gzip          = false
  base64_encode = true

  part {
    filename     = "sshd.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.sshd.rendered
    merge_type   = "list(append)+dict(recurse_array)+str()"
  }

  part {
    filename     = "runcmd.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.runcmd.rendered
    merge_type   = "list(append)+dict(recurse_array)+str()"
  }
}
