provider "google" {
  credentials = jsonencode(var.service_account_key_data)
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region
  deletion_protection = false

  initial_node_count = 1

  node_config {
    machine_type = "e2-medium"
  }
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location

  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}