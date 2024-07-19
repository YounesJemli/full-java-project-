output "secret_id" {
  description = "The ID of the created secret"
  value       = google_secret_manager_secret.my_secret.id
}

output "secret_version" {
  description = "The version of the created secret"
  value       = google_secret_manager_secret_version.my_secret_version.id
}
