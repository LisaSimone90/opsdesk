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
  project = "alpine-bond-501500-f8"
  region  = "us-central1"
}

resource "google_cloud_run_v2_service" "opsdesk" {
  name     = "opsdesk-service"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "us-central1-docker.pkg.dev/alpine-bond-501500-f8/opsdesk-repo/opsdesk-api:v1"
      ports {
        container_port = 8000
      }
    }
  }
}

output "service_uri" {
  value       = google_cloud_run_v2_service.opsdesk.uri
  description = "The public URL of the Cloud Run service"
}
