resource aws_instance "ec2_cluster" {
  count         = 4
  ami                    = "ami-01c36f3329957b16a"
  instance_type          = "t2.medium"
  key_name               = var.key_name

  vpc_security_group_ids = ["sg-020d6b3801a14aa15"]
  subnet_id              = "subnet-02fec602867766f33"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    name = var.instance_name_cluste_1[count.index]
  }
}


resource aws_instance "ec2_cluster_2" {
  count         = 5
  ami                    = "ami-01c36f3329957b16a"
  instance_type          = "t2.medium"
  key_name               = var.key_name

  vpc_security_group_ids = ["sg-020d6b3801a14aa15"]
  subnet_id              = "subnet-06aef87650cbee587"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    name = var.instance_name_cluste_2[count.index]
  }
}




