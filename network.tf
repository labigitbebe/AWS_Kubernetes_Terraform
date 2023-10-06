resource "aws_vpc" "vpc-eks" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    name = "EKS-VPC"
  }
}

resource "aws_internet_gateway" "eks-igw" {
  vpc_id = aws_vpc.vpc-eks.id

  tags = {
    name = "EKS-IGW"
  }

}
