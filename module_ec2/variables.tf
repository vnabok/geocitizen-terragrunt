# Global vars

variable "environment" {
  description = "Name of the environment"
  type = string
}

# Module vars

variable "ec2_type" {
  type = string
  default = "t2.micro"
}

variable "rsa_key_name" {
  type = string
  default = "vn636-rsa-key"
}

variable "ami_id" {
  type = string
  default = "ami-0afd55c0c8a52973a"
}

variable "ec2_name" {
  type = string
  default = "Geocitizen"
}

variable "ec2_sg" {
  description = "SG that will be assigned to EC2 instance"
  type = list
  default = []
}

variable "db_endpoint" {
  description = "RDS DB endpoint"
  type = string
}