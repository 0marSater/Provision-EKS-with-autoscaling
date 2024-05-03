variable "region" {
  type        = string
  description = "Region name"
}

########################### VPC #########################

variable "vpc_cidr" {
  type        = string
  description = "VPC IP"
}


variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames."
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support."
}


variable "vpc_name" {
  type        = string
  description = "VPC name"
}

########################### Public Subnet-1 #########################
variable "public_subnet_1_name" {
  type        = string
  description = "Public subnet-1 name"
}


variable "public_subnet_1_ip" {
  type        = string
  description = "Publuc subnet-1 ip"
}


variable "public_subnet_2_name" {
  type        = string
  description = "Public subnet-2 name"
}


variable "public_subnet_2_ip" {
  type        = string
  description = "Publuc subnet-2 ip"
}
########################### Private Subnet-1 ###########################
variable "private_subnet_1_name" {
  type        = string
  description = "Private subnet-1 name"
}


variable "private_subnet_1_ip" {
  type        = string
  description = "private subnet-1 ip"
}


variable "private_subnet_2_name" {
  type        = string
  description = "private subnet-2 name"
}


variable "private_subnet_2_ip" {
  type        = string
  description = "private subnet-2 ip"
}

########################### Public Route Table #########################

variable "public_rt_name" {
  type        = string
  description = "Public route table name"
}

variable "public_rt_cidr" {
  type        = string
  description = "Public route table cidr block"
}

########################### Private Route Table #########################

variable "private_rt_name" {
  type        = string
  description = "Private route table name"
}

variable "private_rt_cidr" {
  type        = string
  description = "Private route table cidr block"
}


########################### Internet gateway name #########################

variable "ig_name" {
  type        = string
  description = "Name of internet gateway"
}


########################### NAT gateway name #############################

variable "nat_gateway_name" {
  type        = string
  description = "Name of NAT gateway"
}

########################### EIP name ####################################

variable "eip_name" {
  type        = string
  description = "Name of eip"
}


########################### EKS #########################
variable "cluster_name" {
  type        = string
  description = "Name of the cluster"
}

variable "node_group_name" {
  type        = string
  description = "Name of worker node group"
}

variable "instance_types" {
  type        = list(string)
  description = "List of ec2 worker node type"
}

variable "disk_size" {
  type        = number
  description = "Size of ec2 worker node disk"
}

variable "ami_type" {
  type        = string
  description = "The AMI image type"
}

variable "desired_size" {
  type        = number
  description = "Desire number of worker node"
}

variable "max_size" {
  type        = number
  description = "Maximum Number of worker node"
}

variable "min_size" {
  type        = number
  description = "Minimum number of worker node "
}

variable "max_unavailable" {
  type        = number
  description = "Maximum unavailable number of worker node"
}
