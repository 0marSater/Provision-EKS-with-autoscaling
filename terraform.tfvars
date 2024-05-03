#VPC
region                = "eu-west-1"
vpc_cidr              = "192.168.0.0/16"
vpc_name              = "eks-worker-nodes-vpc"
enable_dns_hostnames  = true
enable_dns_support    = true
public_subnet_1_name  = "Public-Subent-1"
public_subnet_1_ip    = "192.168.0.0/18"
public_subnet_2_name  = "Public-Subnet-2"
public_subnet_2_ip    = "192.168.64.0/18"
private_subnet_1_name = "Private-Subent-1"
private_subnet_1_ip   = "192.168.128.0/18"
private_subnet_2_name = "Private-Subnet-2"
private_subnet_2_ip   = "192.168.192.0/18"
public_rt_name        = "Public-rt"
public_rt_cidr        = "0.0.0.0/0"
private_rt_name       = "Private-rt"
private_rt_cidr       = "0.0.0.0/0"
ig_name               = "VPC-IG"
nat_gateway_name      = "NAT-Gateway"
eip_name              = "NAT-EIP"

#EKS
cluster_name    = "eks-cluster-test"
node_group_name = "WorkerNode"
instance_types  = ["t3.small"]
disk_size       = 10
ami_type        = "AL2_x86_64"
desired_size    = 1
max_size        = 3
min_size        = 1
# max_unavailable = 1
