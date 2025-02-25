// VPC
variable "region" {
  type        = string
  description = "aws region"
}

variable "availability_zone" {
  type        = list(string)
  description = "availability zone"
}

variable "name" {
  type        = string
  description = "Name of VPC, subnet, IGW, NAT, and Routetables"
}

variable "cidr_vpc" {
  type        = string
  description = "VPC cidr"
}

variable "cidr_public_subnet" {
  type        = list(string)
  description = "Puvlic Subnet CIDR"
}

variable "cidr_private_subnet" {
  type        = list(string)
  description = "Private Subnete CIDR"
}
