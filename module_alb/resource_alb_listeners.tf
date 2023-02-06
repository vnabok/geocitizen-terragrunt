resource "aws_lb_listener" "default_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "redirect"

    redirect {
        port = "443"
        protocol = "HTTP"
        status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "custom_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port = var.listener_port
  protocol = var.listener_protocol
  #ssl_policy = var.listener_policy

  default_action {
    type = "fixed-response"

    fixed_response {
        content_type = "text/plain"
        message_body = "Forbiden"
        status_code = "403"
    }
  }
}