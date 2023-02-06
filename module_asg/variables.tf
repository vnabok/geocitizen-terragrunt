# Global vars

variable "environment" {
  description = "Name of the environment"
  type = string
}

# Module vars

variable "name_prefix" {
  description = "Name prefix of ASG elements"
  type = string
}

variable "role_description" {
  description = "IAM role description"
  type = string
  default = "Default description"
}

variable "lt_description" {
  description = "LT description"
  type = string
  default = "Default LT description"
}

variable "ebs_optimized" {
  description = "EBS optimized flag"
  type = bool
  default = false
}

variable "image_id" {
  description = "AMI ID"
  type = string
  default = "ami-0afd55c0c8a52973a"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "rsa_key_name" {
  type = string
  default = "vn636-rsa-key"
}

variable "associate_public_ip_address" {
  description = "Flag to assign public IP"
  type = bool
  default = true
}

variable "sec_groups" {
  description = "ASG SGs association"
  type = list
  default = []
}

variable "device_name" {
  description = "Name of mount block device"
  type = string
  default = "/dev/sda1"
}

variable "device_volume_size" {
  description = "Size of EBS"
  type = number
  default = 8
}

variable "device_volume_type" {
  description = "Type of EBS"
  type = string
  default = "gp2"
}

variable "delete_on_termination" {
  description = "Boolean flag to delete EBS on EC2 termination"
  type = bool
  default = true
}

variable "device_enable_encryption" {
  description = "Boolian flag to enable EBS encryption"
  type = bool
  default = false
}

variable "enable_monitoring" {
  description = "Boolian flag to enable monitoring"
  type = bool
  default = false
}

variable "availability_zones" {
  description = "List of AZ where ASG will be placed"
  type = list
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in ASG"
  type = number
  default = 1
}

variable "asg_max_size" {
  description = "Max number of instances in ASG"
  type = number
  default = 1
}

variable "asg_min_size" {
  description = "Min number of instances in ASG"
  type = number
  default = 1
}

variable "tg_port" {
  description = "Target Group port"
  type = number
  default = 80
}

variable "tg_protocol" {
  description = "Target Group protocol"
  type = string
  default = "HTTP" 
}

variable "vpc_id" {
  description = "VPC ID where to place Target Group"
  type = string
}

variable "tg_health_path" {
  description = "Health check path"
  type = string
  default = "/"
}

variable "tg_health_port" {
  description = "Health check port of Target Group"
  type = number
  default = 80
}

variable "tg_health_protocol" {
  description = "Health check protocol of Target Group"
  type = string
  default = "HTTP"
}

variable "tg_health_match" {
  description = "Health check matcher"
  type = string
  default = "200"
}

variable "tg_health_timeout" {
  description = "Health check timeout"
  type = number
  default = 20
}

variable "lb_listener" {
  description = "ALB listener ARN"
  type = string
}

variable "domain_name" {
  description = "ALB DNS"
  type = string
}

variable "db_endpoint" {
  description = "RDS DB endpoint"
  type = string
}