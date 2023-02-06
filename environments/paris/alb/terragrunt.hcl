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
        "subnet-0179fcc2c70064c3d",
        "subnet-0aed48fc3f22727d7",
        "subnet-0b2a71695ae4f4d7e"
    ]
    listener_protocol = "HTTP"
    listener_port = "8080"
}