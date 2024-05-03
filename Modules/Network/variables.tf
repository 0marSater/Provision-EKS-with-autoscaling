
variable "region" {
  type        = string
  description = "Region name"
}

########################### VPC #########################

variable "vpc_cidr" {
  type        = string
  description = "VPC IP"
}


variable "vpc_name" {
  type        = string
  description = "VPC name"
}

########################### Public Subnets #########################
variable "public_subnet_1_name" {
  type        = string
  description = "Public subnet-1 name"
}


variable "public_subnet_1_ip" {
  type        = string
  description = "Public subnet-1 ip"
}


variable "public_subnet_2_name" {
  type        = string
  description = "Public subnet-2 name"
}


variable "public_subnet_2_ip" {
  type        = string
  description = "Publuc subnet-2 ip"
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



variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames."
}


variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support."
}



########################### Private Subnets #########################
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

variable "eip_name_1" {
  type        = string
  description = "Name of first eip"
}

variable "eip_name_2" {
  type        = string
  description = "Name of second eip"
}
