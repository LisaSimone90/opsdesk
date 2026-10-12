terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Artifact Registry Repository
resource "google_artifact_registry_repository" "opsdesk_repo" {
  repository_id = "opsdesk-repo"
  location      = var.region
  format        = "DOCKER"
  description   = "Docker repository for OpsDesk container images"
}

# Cloud Run v2 Service
resource "google_cloud_run_v2_service" "opsdesk" {
  name     = "opsdesk-service"
  location = var.region
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "${var.region}-docker.pkg.dev/${var.project_id}/opsdesk-repo/opsdesk-api:${var.image_tag}"
      ports {
        container_port = 8000
      }
    }
  }
}
