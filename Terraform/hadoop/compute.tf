provider "aws" {
  region           = var.aws_region  
}

resource "aws_instance" "hadoop_namenode" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name = var.aws_keypair 
  public_ip = True
}

