data "external" "service_account_key" {
  program = ["bash", "${path.module}/fetch_secret.sh", var.secret_id, var.project_id]
}
provider "google" {
  //credentials = file("~/Desktop/lofty-shine-427016-t2-587aaaabf199.json")
  credentials = data.external.service_account_key.result["secret_data"]
  region  = var.region
  project = var.project_id

}
data "google_secret_manager_secret_version" "service_account_key" {
  secret  = var.secret_id
  project = var.project_id
}

/*data "google_secret_manager_secret_version" "service_account_key" {
  secret = "projects/${var.project_id}/secrets/${var.secret_id}/versions/latest"
}*/

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