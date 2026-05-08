variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster (used as env identifier)"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where the cluster will be deployed"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for the EKS cluster and node group"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version for the EKS cluster"
  default     = "1.32"
}

variable "node_instance_type" {
  type        = string
  description = "EC2 instance type for managed node group workers"
  default     = "t3.medium"
}

variable "node_desired_size" {
  type        = number
  description = "Desired number of worker nodes"
  default     = 2
}

variable "node_min_size" {
  type        = number
  description = "Minimum number of worker nodes"
  default     = 1
}

variable "node_max_size" {
  type        = number
  description = "Maximum number of worker nodes"
  default     = 3
}
