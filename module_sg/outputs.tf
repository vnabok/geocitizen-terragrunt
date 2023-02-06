output "security_group_id" {
  description = "Security Group ID"
  value = aws_security_group.sec_group.id
}

output "security_group_name" {
  description = "Security Group name"
  value = var.sg_name
}

output "security_group_vpc_id" {
  description = "VPC ID where the Security Group configured"
  value = var.vpc_id
}

output "security_group_rules" {
  description = "Security Group Rules"
  value = var.sg_rules
}