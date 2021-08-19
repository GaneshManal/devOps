provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "hadoop_namenode" {
  count                  = var.namenode_count
  ami                    = var.aws_ami
  instance_type          = var.aws_instance_type
  key_name               = var.aws_keypair
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name  = "hadoop-namenode-${count.index + 1}"
    Owner = "gmanal"
  }
}

resource "aws_instance" "hadoop_datanode" {
  count                  = var.datanode_count
  ami                    = var.aws_ami
  instance_type          = var.aws_instance_type
  key_name               = var.aws_keypair
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name  = "hadoop-datanode-${count.index + 1}"
    Owner = "gmanal"
  }
}

/*
resource "null_resource" "nullremote3" {
  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = [
    aws_instance.hadoop_namenode,
  ]

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("/Users/ganesh/DevOps-SRE.pem")
    host        = aws_instance.hadoop_namenode.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      // "yum update -y",
      // "groupadd centos",
      // "adduser centos -g centos",
      // "cd /home/centos",
      // "wget --no-cookies --no-check-certificate --header \"Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie\" \"http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz\"",
      // "tar -xzvf jdk-8u131-linux-x64.tar.gz",
      // "rm -rf jdk-8u131-linux-x64.tar.gz"
      // "rpm -ivh jdk-8u25-linux-x64.rpm",
      // "java -version",
      // "export JAVA_HOME=/usr/java/jdk1.8.0_25/",
      // "export PATH=$PATH:$JAVA_HOME"
    ]
  }
}
*/
