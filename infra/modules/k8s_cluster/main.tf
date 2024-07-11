resource "digitalocean_kubernetes_cluster" "main" {
  
  name    = var.cluster_name
  region  = var.region
  version = var.kubernetes_version
  
  tags = ["k8s", "dev"]


  node_pool {
    name       = var.node_pool_name
    size       = var.node_size
    node_count = var.node_count

    tags = ["k8s", "dev"]
  }
}
