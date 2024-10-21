
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "prefix" {
  description = "Prefix for the resources"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "retention_days" {
  description = "Retention days for the CloudWatch log group"
  type        = number
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}

variable "desired_size" {
  description = "Desired size for the EKS node group"
  type        = number
}

variable "max_size" {
  description = "Max size for the EKS node group"
  type        = number
}

variable "min_size" {
  description = "Min size for the EKS node group"
  type        = number
}