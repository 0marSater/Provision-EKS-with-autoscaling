####################### EKS #######################

resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn
  #latest version used was 1.29
  vpc_config {
    subnet_ids = var.subnet_ids
  }
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController
  ]
}

####################### EKS Addons #######################

resource "aws_eks_addon" "coredns" {
  cluster_name                = aws_eks_cluster.this.name
  addon_name                  = "coredns"
  # addon_version               = "v1.11.1-eksbuild.6"
  resolve_conflicts_on_create = "OVERWRITE"
}

resource "aws_eks_addon" "kube-proxy" {
  cluster_name                = aws_eks_cluster.this.name
  addon_name                  = "kube-proxy"
  addon_version               = "v1.29.1-eksbuild.2"
  resolve_conflicts_on_create = "OVERWRITE"
}


resource "aws_eks_addon" "vpc-cni" {
  cluster_name                = aws_eks_cluster.this.name
  addon_name                  = "vpc-cni"
  addon_version               = "v1.18.0-eksbuild.1"
  resolve_conflicts_on_create = "OVERWRITE"
}


####################### OIDC #######################

data "tls_certificate" "example" {
  url = aws_eks_cluster.this.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "my_oidc" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.example.certificates[0].sha1_fingerprint]
  url             = data.tls_certificate.example.url
}