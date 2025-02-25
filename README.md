# VPC - IAC Infra

This repository manages the creation of a Virtual Private Cloud (VPC) in AWS for different environments using Terraform. Each environment (e.g., `dev`, `stage`, `prod`) is managed with specific `tfvars` files, which define values such as region and availability zones. The default values for public subnets, private subnets, and VPC CIDR ranges are provided in the `variables.tf` file.

### Features
- Create a VPC with customizable CIDR block.
- Option to enable/disable the creation of public and private subnets.
- Internet Gateway and NAT Gateway configuration.
- Create and manage route tables.
- Associate route tables with subnets.
- Support for tagging resources.

### Requirements
- Terraform v1.0+
- AWS Provider v4.0+

### Environment-Specific Configuration
Developers are responsible for creating their own `.tfvars` files for each environment (e.g., `dev`, `test`, `prod`). These files contain the values for variables specific to each environment, such as the region, availability zones, and CIDR ranges.

**Example: dev.tfvars**
```
# Region for AWS resources
region = "<region>"

# Availability Zones
availability_zone = ["availability_zone_a", "availability_zone_b", "availability_zone_c"]
```
Developers can modify the CIDR blocks and other variables to suit the environment's requirements.

## Usage
1. **Create Environment-Specific .tfvars Files**
- Create a .tfvars file for each environment (e.g., dev.tfvars) and define the required values.
2. **Authenticate with AWS**

- Set your AWS credentials and region using environment variables:
bash
```
export AWS_ACCESS_KEY_ID="your_aws_access_key_id"
export AWS_SECRET_ACCESS_KEY="your_aws_secret_access_key"
export AWS_DEFAULT_REGION="your_aws_default_region"
```
3. **Initialize Terraform**

- Initialize the Terraform working directory and configure the backend:
```
terraform init -reconfigure -backend-config="backends/<environment>.hcl"
```
4. **Validate the Configuration**

- Format and validate the Terraform configuration:
```
terraform fmt
terraform validate
```
5. **Plan the Deployment**

- Generate and review the execution plan:
```
terraform plan -var-file="<environment>.tfvars" -out=tfplan
```

6. **Apply the Configuration**

- Apply the planned changes to create the VPC:
```
terraform apply "tfplan"
```

7. **Destroy the Resources**

- If you need to remove the resources, run:
```
terraform destroy -var-file="<environment>.tfvars"
```
## Inputs
The input variables are defined in the variables.tf file, but the values for each environment are passed through the `.tfvars` files.
| Name                | Description                          |    Type    |     Default   |   Required    |
| ------------------- | -------------------------------------|------------|---------------|---------------|
| `availability_zone` |List of availability zones for subnets|   `list`   |    ""        |    Yes    |
| `region`            |AWS region to deploy the VPC          |   `string` |    ""        |    Yes    |
|`vpc_cidr_block`     |The CIDR block for the VPC            |   `string` |`"10.0.0.0/16"`|    Yes    |
|`public_subnet_cidrs`|List of CIDR blocks for public subnets|   `list`   |`["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]`| Yes |
|`private_subnet_cidrs`|List of CIDR blocks for private subnets| `list`   |`["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]`| Yes |

## Outputs

| Name | Description |
| ------ | ------ |
| `vpc_id` |The ID of the created VPC|
| `public_subnets`| IDs of the created public subnets |
|`public_subnets`|IDs of the created private subnets|
|`nat_gateway_public_ip`|IDs of the Nat-Gateway-public-IP|


