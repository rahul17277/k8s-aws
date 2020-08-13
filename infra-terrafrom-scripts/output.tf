output "cluster_one_instace_ip" {
  value = aws_instance.ec2_cluster[*].public_ip
}

output "cluster_second_instace_ip" {
  value = aws_instance.ec2_cluster_2[*].public_ip
}