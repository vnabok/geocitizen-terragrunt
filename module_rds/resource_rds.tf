resource "aws_db_instance" "rds" {
#  db_name = var.rds_name
  identifier = var.db_identifier
  availability_zone = var.db_availability_zone
  instance_class = var.db_instance_class
  engine = var.db_engine
  username = var.db_username
  password = var.db_password
  allocated_storage = var.db_allocated_storage
  skip_final_snapshot = var.db_skip_final_snapshot
  port = var.db_port
  vpc_security_group_ids = var.db_sg

  tags = {
    "Name" = var.rds_name,
    "Env" = var.environment
  }
}