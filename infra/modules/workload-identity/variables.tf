variable "gcp_project_id" {
  type        = string
  description = "The ID of the GCP project."
}

variable "service_account_id" {
  type        = string
  description = "The ID of the service account."
}

variable "workload_identity_pool_id" {
  type        = string
  description = "The ID of the workload identity pool."
}

variable "workload_identity_pool_provider_id" {
  type        = string
  description = "The ID of the workload identity pool provider."
}

variable "gh_repository" {
  type        = string
  description = "The GitHub repository name."
}