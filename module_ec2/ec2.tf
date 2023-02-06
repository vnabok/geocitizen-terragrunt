data "template_file" "mvn_config" {
  template = file("init-script.sh")

  vars = {
    rds_endpoint = var.db_endpoint
  }
}

resource "aws_instance" "test_ubuntu" {
  instance_type = var.ec2_type
  key_name      = var.rsa_key_name #"vn636-rsa-key"
  ami           = var.ami_id       #"ami-0afd55c0c8a52973a"
  vpc_security_group_ids = var.ec2_sg

  tags          = {
    "Environment" = var.environment
    "Name" = var.ec2_name
  }
  user_data     = data.template_file.mvn_config.rendered #file("init-script.sh")
}