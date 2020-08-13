variable "key_name" {
  default = "k8s-interview"
}

variable "instance_name_cluste_1" {
  type = "list"
  default = ["master", "worker1","worker2", "worker3"]
}


variable "instance_name_cluste_2" {
  type = "list"
  default = ["HA-proxy", "master1_cluster2", "master2_cluster2","master3_cluster2", "worker1_cluster2"]
}