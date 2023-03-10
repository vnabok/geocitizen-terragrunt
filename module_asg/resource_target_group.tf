resource "aws_lb_target_group" "lb_target_group" {
  name = "${local.name}-tg"
  port = var.tg_port
  protocol = var.tg_protocol
  vpc_id = var.vpc_id

  health_check {
    path = var.tg_health_path
    port = var.tg_health_port
    protocol = var.tg_health_protocol
    matcher = var.tg_health_match
    timeout = var.tg_health_timeout
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    "Name" = "${local.name}-tg",
    "Environment" = var.environment
  }
}

resource "aws_autoscaling_attachment" "autoscaling_attachment" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  alb_target_group_arn = aws_lb_target_group.lb_target_group.arn
}