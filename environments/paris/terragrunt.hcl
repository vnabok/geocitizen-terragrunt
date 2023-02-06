generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
    profile = "${your_profile}"
    region  = "eu-west-3"
    version = "= 3.55.0"
    shared_credentials_file = "~/.aws/credentials"
  }
EOF
}

terraform {
    extra_arguments "variables" {
        commands = get_terraform_commands_that_need_vars()
        optional_var_files = [
            find_in_parent_folders("environment.tfvars", "ignore")
        ]
    }
}
