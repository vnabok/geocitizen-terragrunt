data "template_file" "mvn_config" {
  template = filebase64("init-script.sh")

  vars = {
    rds_endpoint = var.db_endpoint
  }
}

resource "aws_launch_template" "asg_launch_template" {
  name = "${local.name}-lt"
  description = var.lt_description

  ebs_optimized = var.ebs_optimized
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.rsa_key_name
  user_data = data.template_file.mvn_config.rendered #filebase64("${path.module}/init-script.sh")

  iam_instance_profile {
    arn = aws_iam_instance_profile.instance_profile.arn
  }

  network_interfaces {
    associate_public_ip_address = var.associate_public_ip_address
    security_groups = var.sec_groups
  }

  block_device_mappings {
    device_name = var.device_name
    ebs {
        volume_size = var.device_volume_size
        volume_type = var.device_volume_type
        delete_on_termination = var.delete_on_termination
        encrypted = var.device_enable_encryption
    }
  }

  monitoring {
    enabled = var.enable_monitoring
  }

  tags = {
    "Name"= "${local.name}-lt"
    Environmen = var.environment
  }

  depends_on = [
    aws_iam_instance_profile.instance_profile,
    aws_iam_role_policy_attachment.instance_policy_attachment
  ]
}

