output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  description = "API server endpoint of the EKS cluster"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_ca_certificate" {
  description = "Base64-encoded certificate authority data for the cluster"
  value       = aws_eks_cluster.main.certificate_authority[0].data
}

output "cluster_security_group_id" {
  description = "ID of the security group attached to the EKS control plane"
  value       = aws_security_group.cluster.id
}

output "node_group_role_arn" {
  description = "ARN of the IAM role used by the managed node group"
  value       = aws_iam_role.node_group.arn
}
