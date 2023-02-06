include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../module_alb"
}

dependency "security_group" {
    config_path = "../security_groups/alb_sg"
    mock_outputs_allowed_terraform_commands = ["validate"]
    mock_outputs = {
      security_group_id = "security_group_id"
    }
}

inputs = {
    name = "Geocitizen-alb"
    security_groups = [ dependency.security_group.outputs.security_group_id ]
    subnets = [
        "subnet-id",
        "subnet-id",
        "subnet-id"
    ]
    listener_protocol = "HTTP"
    listener_port = "8080"
}
