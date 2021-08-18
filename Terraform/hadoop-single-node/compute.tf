provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "hadoop_namenode" {
  ami             = var.aws_ami
  instance_type   = var.aws_instance_type
  key_name        = var.aws_keypair
  subnet_id       = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name  = "hadoop-namenode"
    Owner = "gmanal"
  }
}

resource "null_resource" "nullremote3"  {
  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = [
    aws_instance.hadoop_namenode,
  ]

  connection {
    type     = "ssh"
    user     = "root"
    private_key = file("/Users/ganesh/DevOps-SRE.pem")
    host     = aws_instance.hadoop_namenode.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      /*
      "yum update -y",
      "groupadd centos",
      "adduser centos -g centos",
      "cd /home/centos",
      "wget https://downloads.apache.org/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz",
      "tar xvzf hadoop-3.3.1.tar.gz",
      */
      "wget https://javadl.oracle.com/webapps/download/AutoDL?BundleId=245049_d3c52aa6bfa54d3ca74e617f18309292",
      "rpm -ivh jdk-8u25-linux-x64.rpm",
      "java -version",
      "export JAVA_HOME=/usr/java/jdk1.8.0_25/",
      "export PATH=$PATH:$JAVA_HOME"
    ]
  }
}

