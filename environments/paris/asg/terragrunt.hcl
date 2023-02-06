include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../module_asg"
}

dependency "security_group" {
    config_path = "../security_groups/ec2_sg"
    mock_outputs_allowed_terraform_commands = ["validate"]
    mock_outputs = {
        security_group_id = "security_group_id"
    }
}

dependency "alb" {
    config_path = "../alb"
    mock_outputs_allowed_terraform_commands = ["validate"]
    mock_outputs = {
        alb_listener_arn = "alb_listener_arn",
        alb_dns_name = "alb_dns_name"
    }
}

dependency "rds_endpoint" {
    config_path = "../rds"
    mock_outputs_allowed_terraform_commands = ["validate"]
    mock_outputs = {
      db_dns_endpoint = "db_dns_endpoint"
    }
}

inputs = {
    name_prefix = "app"
    asg_desired_capacity = 2
    asg_max_size = 3
    asg_min_size = 1

    vpc_id = "vpc-id"
    tg_port = 8080
    tg_protocol = "HTTP"

    tg_health_path = "/"
    tg_health_port = 8080
    tg_health_protocol = "HTTP"
    tg_health_match = 200
    tg_health_timeout = 10

    lb_listener = dependency.alb.outputs.alb_listener_arn
    domain_name = dependency.alb.outputs.alb_dns_name
    db_endpoint = dependency.rds_endpoint.outputs.db_dns_endpoint
    
    sec_groups = [ dependency.security_group.outputs.security_group_id ]
    device_enable_encryption = false
    availability_zones = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
}
