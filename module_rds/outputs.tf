output "db_name" {
  description = "DB name"
  value = var.rds_name
}

output "db_dns_endpoint" {
  description = "DB DNS Endpoint"
  value = aws_db_instance.rds.endpoint
}