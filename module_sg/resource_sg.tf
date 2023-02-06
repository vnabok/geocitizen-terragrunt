resource "aws_security_group" "sec_group" {
  vpc_id = var.vpc_id
  name = var.sg_name
  description = var.sg_description

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    "Name" = var.sg_name,
    "Env" = var.environment
  }
}