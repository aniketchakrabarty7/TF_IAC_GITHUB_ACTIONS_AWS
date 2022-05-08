output "instance_ip_addr" {
  value = aws_instance.tf-iac-test-server.public_ip
}
