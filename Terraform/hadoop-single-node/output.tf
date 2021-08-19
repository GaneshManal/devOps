### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
  content = templatefile("templates/inventory.tmpl",
    {
      namenode-dns = aws_instance.hadoop_namenode.*.public_dns,
      namenode-ip  = aws_instance.hadoop_namenode.*.public_ip,
      namenode-id  = aws_instance.hadoop_namenode.*.id
      datanode-dns = aws_instance.hadoop_datanode.*.public_dns,
      datanode-ip  = aws_instance.hadoop_datanode.*.public_ip,
      datanode-id  = aws_instance.hadoop_datanode.*.id
    }
  )
  filename = "playbooks/hosts.ini"
}
