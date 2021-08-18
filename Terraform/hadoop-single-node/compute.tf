provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "hadoop_namenode" {
  ami             = var.aws_ami
  instance_type   = var.aws_instance_type
  key_name        = var.aws_keypair
  subnet_id       = var.subnet_id
  security_groups = var.security_group_ids

  tags = {
    Name  = "hadoop-namenode"
    Owner = "gmanal"
  }

}
