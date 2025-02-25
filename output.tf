// EKS cluster
output "vpc_id" {
  description = "VPC id"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "public subnet ids"
  value       = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  description = "private subnet ids"
  value       = module.vpc.private_subnet_id
}

output "nat_gateway_public_ip" {
  description = "get the natgateway public ip"
  value       = module.vpc.nat_gateway_public_ip
}