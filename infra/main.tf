terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}


module "k8s_cluster" {
  source = "./modules/k8s_cluster"
  region             = var.region
  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version
  node_pool_name     = var.node_pool_name
  node_count         = var.node_count
  node_size          = var.node_size
}
