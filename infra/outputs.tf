output "k8s_cluster_id" {
  description = "The ID of the Kubernetes cluster"
  value       = module.k8s_cluster.cluster_id
}
