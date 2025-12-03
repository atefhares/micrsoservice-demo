module "cluster-1" {
  source     = "./modules/gke-cluster-standard"
  project_id = local.project_id
  name       = "cluster-1"
  location   = local.region

  access_config = {
    dns_access = false
    ip_access = {
      authorized_ranges = {
        internal-vms = "0.0.0.0/0" # Using GH public runners 
      }
      gcp_public_cidrs_access_enabled = true
    }
    private_nodes = true
    master_ipv4_cidr_block = "172.16.20.0/28"
  }

  vpc_config = {
    network    = module.microservice-vpc.self_link
    subnetwork = module.microservice-vpc.subnets["${local.region}/microservice-subnet"].self_link
    secondary_range_names = {
      pods     = "pods"
      services = "services"
    }
  }

  max_pods_per_node = 32
}

module "cluster-1-nodepool-1" {
  source       = "./modules/gke-nodepool"
  project_id = local.project_id
  cluster_name = module.cluster-1.name
  location   = local.region
  name         = "nodepool-1"
  node_config = {
    machine_type        = "n2-standard-2"
    disk_size_gb        = 50
    disk_type           = "pd-ssd"
    ephemeral_ssd_count = 1
    gvnic               = true
  }
  nodepool_config = {
    autoscaling = {
      max_node_count = 3
      min_node_count = 1
    }
    management = {
      auto_repair  = true
      auto_upgrade = true
    }
  }
}