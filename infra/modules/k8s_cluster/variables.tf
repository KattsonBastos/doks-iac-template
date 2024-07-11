variable "region" {
  description = "Cluster Region"
  type        = string
  default     = "nyc3"
}

variable "cluster_name" {
  description = "Cluster Name"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes Version"
  type        = string
  default     = "1.30.1-do.0"
}

variable "node_pool_name" {
  description = "Node Name"
  type        = string
}

variable "node_count" {
  description = "Node Count"
  type        = number
  default     = 1
}

variable "node_size" {
  description = "Node Size"
  type        = string
  default     = "s-2vcpu-4gb"
}
