provider "aws" {
  region  = var.region
}

module "vpc" {
  source              = "./vpc"
  region              = var.region
  name                = var.name
  cidr_vpc            = var.cidr_vpc
  cidr_private_subnet = var.cidr_private_subnet
  cidr_public_subnet  = var.cidr_public_subnet
  availability_zone   = var.availability_zone
}
