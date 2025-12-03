resource "google_artifact_registry_repository" "docker_repo" {
  location      = local.region
  repository_id = "microservice-app-repo"
  format        = "DOCKER"
  description   = "A Docker repository for microservice application images"
  project       = local.project_id
}