include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../module_rds"
}

dependency "security_group" {
    config_path = "../security_groups/rds_sg"
    mock_outputs_allowed_terraform_commands = ["validate"]
    mock_outputs = {
      security_group_id = "security_group_id"
    }
}

inputs = {
      rds_name = "ss_demo_1"
      db_identifier = "ss-demo-1"
      db_availability_zone = "eu-west-3a"
      db_sg = [ dependency.security_group.outputs.security_group_id ]
}
