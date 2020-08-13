# k8s-aws

## k8s cluster 1 master multipule node using kubeadm

## Prerequisites:

One or more machines running Linux operating system like deb/rmp. I’m going to use Ubuntu 18.04
2 GB+ of RAM / machine (works with less RAM but, you cannot run later on heavy resource applications).
Min 2 vCPU for master node (control-plane node).
Full network connectivity between machines (machines can be in either public network or private network, respectively).
Swap space must be disabled. You MUST disable swap in order for the kubelet to work properly. To disable swap, hash out the line about swap from the /etc/fstab file. And run sudo swapoff -a
Letting IP tables see bridged traffic. To perform this, run the below commands on all the three nodes. Also, on the Linux VMs don’t forget to enable IP Forwarding:

```
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system
```

## Setup Kubernetes Cluster
All the prerequisites has been taken care, now we need to install the Kube components, network plugin called Calico, and the container runtime. In our case, we will use docker as our container runtime.

The three Kube components that we will be installing are:

kubeadm
kubectl
kubelet


## Set up each server in the cluster to run Kubernetes.

Install Docker on all nodes (master and worker):
https://kubernetes.io/docs/setup/production-environment/container-runtimes/

## On each of the three Ubuntu servers run the following commands as root:

```
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

## Setup the Kubernetes master node:

```
1. kubeadm init
2. To start using your cluster, you need to run the following as a regular user:
   mkdir -p $HOME/.kube
   sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
   sudo chown $(id -u):$(id -g) $HOME/.kube/config
   
```

## Installing the Network plugin

There are various network plugins that Kubernetes supports. I will be using Calico.

To install the network plugin, we will make use of our newly installed kubectl.

```
 kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
```

## Join your nodes to your Kubernetes cluster
You will get join command after kubeadm init

```
kubeadm join --token <token> <control-plane-host>:<control-plane-port> --discovery-token-ca-cert-hash sha256:<hash>
```

