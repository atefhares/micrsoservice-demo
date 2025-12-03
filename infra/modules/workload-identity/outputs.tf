output "workload_identity_provider" {
  value = google_iam_workload_identity_pool_provider.gh-provider.name
}

output "service_account_email" {
  value = google_service_account.github-actions.email
}