variable "project_id" {
  type        = string
  description = "The GCP project ID to deploy resources into"
}

variable "region" {
  type        = string
  description = "Primary GCP region for resources"
  default     = "us-central1"
}

variable "image_tag" {
  type        = string
  description = "Image version tag deployed to Cloud Run"
  default     = "v1"
}
