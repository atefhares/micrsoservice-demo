terraform {
  required_version = ">= 1.12.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "< 8.0.0"
    }
  }
  backend "gcs" {
    bucket = "terraform-state-atefhares-atefpg"
    prefix = "terraform/state"
  }
}