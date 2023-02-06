resource "aws_lb" "alb" {
  name = var.name
  internal = var.internal
  load_balancer_type = "application"
  security_groups = var.security_groups
  subnets = var.subnets
  enable_deletion_protection = var.enable_deletion_protection

  tags = {
    "Environment" = var.environment
  }
}