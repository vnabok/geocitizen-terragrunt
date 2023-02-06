# Global vars

variable "environment" {
  description = "Name of the environment"
  type = string
}

# Module vars

variable "vpc_id" {
  description = "VPC ID where SG will be placed"
  type = string
}

variable "sg_name" {
  description = "Name of the security group"
  type = string
#  default = "Default name"
}

variable "sg_description" {
  description = "Description of the security group"
  type = string
  default = "Default description"
}

variable "sg_rules" {
  description = "Security group rules"
  type = map
  default = {}
}

# variable "source_sg" {
#   description = "Source SG for SG rules"
#   type = string
#   default = aws_default_security_group.default.id
# }