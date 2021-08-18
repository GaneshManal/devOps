provider "aws" {
  region           = "us-east-2"  
}

resource "aws_instance" "hadoop_namenode" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name = var.aws_keypair
  subnet_id = var.subnet_id
  security_groups = var.security_group_ids

  tags = {
    Name = "hadoop-namenode"
    Owner = "gmanal"
  }

}
