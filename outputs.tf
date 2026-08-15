output "nom_instance" {
  value = aws_instance.EC2.tags
}

output "type_instance" {
  value = aws_instance.EC2.instance_type
}
output "region_aws" {
  value = aws_instance.EC2.region
}
output "image_ubuntu" {
  value = aws_instance.EC2.ami
}

output "ip_public" {
  value = aws_instance.EC2.public_ip
}

output "ip_prive" {
  value = aws_instance.EC2.private_ip
}