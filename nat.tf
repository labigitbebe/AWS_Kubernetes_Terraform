resource "aws_eip" "nat-eip" {
  domain = "vpc"

  tags = {
    name = "nat"
  }
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.public-us-west-1a.id

  tags = {
    name = "nat"
  }

  depends_on = [aws_internet_gateway.eks-igw]
}
