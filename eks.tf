
resource "aws_iam_role" "eks-role" {
  name = "eks-cl-demo"


  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    name = "eks-role"
  }
}

resource "aws_iam_role_policy_attachment" "demo-eks-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-role.name

}

resource "aws_eks_cluster" "demo" {
  name     = "demo-eks"
  role_arn = aws_iam_role.eks-role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-us-west-1a.id,
      aws_subnet.private-us-west-1b.id,
      aws_subnet.public-us-west-1a.id,
      aws_subnet.public-us-west-1a.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.demo-eks-policy]

}

output "endpoint" {
  value = aws_eks_cluster.demo.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.demo.certificate_authority[0].data
}
