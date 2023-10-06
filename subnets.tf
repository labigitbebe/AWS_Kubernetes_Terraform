resource "aws_subnet" "private-us-west-1a" {
  vpc_id            = aws_vpc.vpc-eks.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "us-west-1a"

  tags = {
    "name"                             = "private-us-west-1a"
    "kubernetes.io/roles/internal-elb" = "1"
    "kubernetes.io/cluster/demo-eks"   = "owned"
  }
}

resource "aws_subnet" "private-us-west-1b" {
  vpc_id            = aws_vpc.vpc-eks.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "us-west-1b"

  tags = {
    "name"                             = "private-us-west-1b"
    "kubernetes.io/roles/internal-elb" = "1"
    "kubernetes.io/cluster/demo-eks"   = "owned"
  }
}

resource "aws_subnet" "public-us-west-1a" {
  vpc_id                  = aws_vpc.vpc-eks.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    "name"                             = "public-us-west-1a"
    "kubernetes.io/roles/internal-elb" = "1"
    "kubernetes.io/cluster/demo-eks"   = "owned"
  }
}

resource "aws_subnet" "public-us-west-1b" {
  vpc_id                  = aws_vpc.vpc-eks.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = true

  tags = {
    "name"                             = "public-us-west-1b"
    "kubernetes.io/roles/internal-elb" = "1"
    "kubernetes.io/cluster/demo-eks"   = "owned"
  }
}