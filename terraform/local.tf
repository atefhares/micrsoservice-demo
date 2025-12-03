locals {
  project_id = "atefhares-atefpg"
  region     = "me-central2"


  service_account_id                 = "github-actions"
  workload_identity_pool_id          = "gh-action-pool"
  workload_identity_pool_provider_id = "gh-action-provider"
  gh_repository                      = "micrsoservice-demo"
}