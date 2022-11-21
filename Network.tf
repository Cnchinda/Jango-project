
terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
      }
    }
}

resource "aws_vpc" "Jango-vpc" {
    cidr_block = var.cidr_block
    instance_tenancy = "default"

    tags = {
        name = "Jango-vpc"
    }
} 

data "aws_availability_zones" "available" {
  state = "available"
}
# creating 3 private subnet uding on resource block. this will laverage the idea of meta-arguments like count,for each and depends On

resource "aws_subnet" "Jango_private_subnets" {
        count = length(var.Jango_private_subnets)

    vpc_id = local.vpc_id
    cidr_block = var.Jango_private_subnets[count.index]
    availability_zone = slice(data.aws_availability_zones.available.names, 0,3)[count.index]

    tags = {
        name = "Jango_private_subnet_${count.index +1}" #(count.index)
    }
}

resource "aws_subnet" "Jango_public_subnets" {
    count = length(var.Jango_public_subnets)

    vpc_id = local.vpc_id
    cidr_block = var.Jango_public_subnets[count.index]
    availability_zone = slice(data.aws_availability_zones.available.names, 0,3)[count.index]

    tags = {
        name = "Jango_public_subnet_${count.index +1}"
    }
}

resource "aws_subnet" "Jango_data_subnets" {
    count = length(var.Jango_data_subnets)

    vpc_id = local.vpc_id
    cidr_block = var.Jango_data_subnets[count.index]
    availability_zone = slice(data.aws_availability_zones.available.names, 0,3)[count.index]

    tags = {
        name = "Jango_data_subnet_${count.index +1}"
    }
}
