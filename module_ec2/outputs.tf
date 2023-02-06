output "ec2_instance_ip" {
  value = aws_instance.test_ubuntu.public_ip
}