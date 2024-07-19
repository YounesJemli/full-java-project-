provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_secret_manager_secret_version" "my_secret_version" {
  secret      = google_secret_manager_secret.my_secret.id
  secret_data = file(var.secret_file_path)
}
resource "google_secret_manager_secret" "my_secret" {
  secret_id = var.secret_id
  replication {
    user_managed {
      replicas {
        location = "us-central1"
      }
      replicas {
        location = "europe-west1"
      }
    }
  }
}

output "service_account_key" {
  value = google_secret_manager_secret_version.my_secret_version.secret_data
  sensitive = true
}


