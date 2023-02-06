# Global vars

variable "environment" {
  description = "Name of the environment"
  type = string
}

# Module vars

variable "rds_name" {
  description = "DB name"
  type = string
}

variable "db_identifier" {
  description = "DB identifier"
  type = string
}

variable "db_availability_zone" {
  description = "DB AZ placement location"
  type = string
}

variable "db_instance_class" {
  description = "instance_class of DB"
  type = string
  default = "db.t4g.micro"
}

variable "db_engine" {
  description = "DB engine"
  type = string
  default = "postgres"
}

variable "db_username" {
  description = "DB username"
  type = string
  default = "postgres"
}

variable "db_password" {
  description = "DB password"
  type = string
  default = "postgres"
}

variable "db_allocated_storage" {
  description = "DB allocated storage"
  type = number
  default = 20
}

variable "db_skip_final_snapshot" {
  description = "DB skip_final_snapshot flag"
  type = bool
  default = true
}

variable "db_port" {
  description = "DB port"
  type = number
  default = 5432
}

variable "db_sg" {
  description = "DB security group"
  type = list
  default = []
}