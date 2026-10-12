output "service_uri" {
  description = "The public URL of the Cloud Run service"
  value       = google_cloud_run_v2_service.opsdesk.uri
}

output "artifact_registry_id" {
  description = "The fully qualified resource name of the Artifact Registry repository"
  value       = google_artifact_registry_repository.opsdesk_repo.id
}
