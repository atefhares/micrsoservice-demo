
module "workload-identity" {
  source                             = "./modules/workload-identity"
  gcp_project_id                     = local.project_id
  service_account_id                 = local.service_account_id
  gh_repository                      = local.gh_repository
  workload_identity_pool_id          = local.workload_identity_pool_id
  workload_identity_pool_provider_id = local.workload_identity_pool_provider_id
}