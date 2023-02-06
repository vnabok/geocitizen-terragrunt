# Global vars

variable "environment" {
  description = "Name of the environment"
  type = string
}

# Module vars

variable "name" {
  description = "Name of ALB"
  type = string
}

variable "internal" {
  description = "Boolean flag for internal or external LB mode"
  type = bool
  default = false
}

variable "security_groups" {
  description = "Security groups"
  type = list
  default = []
}

variable "subnets" {
  description = "Subnets"
  type = list
  default = []
}

variable "enable_deletion_protection" {
  description = "Boolean flag for enable deletion protection"
  type = bool
  default = false
}

variable "listener_port" {
  description = "ALB listener port"
  type = number
  default = "443"
}

variable "listener_protocol" {
  description = "ALB listener protocol"
  type = string
  default = "HTTPS"
}

variable listener_policy {
  description = "Listener policy"
  type = string
  default = "ELBSecurityPolicy-2016-08"
}