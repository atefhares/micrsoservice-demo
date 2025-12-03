locals {
  gh_iam_roles = [
    "roles/editor"
  ]
}

// Create service account for gcp in terraform
resource "google_service_account" "github-actions" {
  project      = var.gcp_project_id
  account_id   = var.service_account_id
  display_name = "GitHub Actions Service Account"
}


resource "google_project_iam_member" "iam_roles" {
  for_each = toset(local.gh_iam_roles)
  project = var.gcp_project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.github-actions.email}"

  depends_on = [google_service_account.github-actions]
}

// Create Workload Identity Pool
resource "google_iam_workload_identity_pool" "gh-pool" {
  project                   = var.gcp_project_id
  workload_identity_pool_id = var.workload_identity_pool_id
  display_name              = "GitHub Actions Pool"
  description               = "Workload Identity Pool for GitHub Actions pipelines"
}

// Create Workload Identity Provider
resource "google_iam_workload_identity_pool_provider" "gh-provider" {
  project                            = var.gcp_project_id
  workload_identity_pool_provider_id = var.workload_identity_pool_provider_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.gh-pool.workload_identity_pool_id
  display_name                       = "GitHub Actions Provider"
  description                        = "Workload Identity Provider for GitHub Actions pipelines"

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository_owner" = "assertion.repository_owner"
  }
  attribute_condition = "assertion.repository_owner=='atefhares'"

  depends_on = [google_iam_workload_identity_pool.gh-pool]
}

// Allow authentications from the Workload Identity Provider originating from the repository
resource "google_service_account_iam_binding" "service-account-iam" {
  service_account_id = google_service_account.github-actions.id
  role               = "roles/iam.workloadIdentityUser"
  members = [
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.gh-pool.name}/attribute.repository/atefhares/${var.gh_repository}"
  ]

  depends_on = [google_iam_workload_identity_pool_provider.gh-provider]
}