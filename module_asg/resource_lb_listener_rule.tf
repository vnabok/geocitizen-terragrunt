resource "aws_lb_listener_rule" "lb_listener_rule" {
  listener_arn = var.lb_listener

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }

  condition {
    host_header {
        values = [var.domain_name]
    }
  }
}