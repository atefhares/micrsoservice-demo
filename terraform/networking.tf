module "microservice-vpc" {
  source     = "./modules/net-vpc"
  project_id = local.project_id
  name       = "microservice-vpc"
  subnets = [
    {
      ip_cidr_range = "10.0.0.0/24"
      name          = "microservice-subnet"
      region        = local.region
      secondary_ip_ranges = {
        pods     = { ip_cidr_range = "172.16.0.0/20" }
        services = { ip_cidr_range = "192.168.0.0/24" }
      }
    }
  ]
}