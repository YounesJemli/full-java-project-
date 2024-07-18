variable "project_id" {
  description = "lofty-shine-427016-t2"
  type        = string
}

data "google_secret_manager_secret_version" "service_account_key" {
  secret_id = "devops-service-account-key"
}

variable "service_account_key_data" {
  type = string
}

locals {
  service_account_key_data = jsondecode(data.google_secret_manager_secret_version.service_account_key.data)
}

variable "region" {
  description = "europe-west1-d"
  type        = string
  default     = "europe-west1-d"
}

variable "cluster_name" {
  description = "my-gke-cluster"
  type        = string
  default     = "my-gke-cluster"
}
variable "node_count" {
  description = "Number of nodes"
  type        = number
  default     = 1
}

variable "node_machine_type" {
  description = "Type of machine to use for nodes"
  type        = string
  default     = "e2-medium"
}
variable "node_preemptible" {
  type = bool
}

variable "initial_node_count" {
  type = number
}
