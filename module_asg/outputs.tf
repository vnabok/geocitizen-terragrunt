output "launch_template_name" {
  description = "Launch template name"
  value = aws_launch_template.asg_launch_template.name
}

output "asg_name" {
  description = "Autoscaling group name"
  value = aws_autoscaling_group.asg.name
}