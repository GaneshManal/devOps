variable "aws_keypair" {
  default = "DevOps-SRE"
}

variable "vpc_id" {
  default = "vpc-9ad309f1"
}
variable "subnet_id" {
  default = "subnet-d7b981ad"
}

variable "security_group_ids" {
  default = ["sg-06175e42b45d69a98"]
}

variable "aws_ami" {
  default = "ami-0003569dd0860582f"

}

variable "aws_instance_type" {
  default = "t2.micro"
}