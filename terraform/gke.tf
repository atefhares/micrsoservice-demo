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