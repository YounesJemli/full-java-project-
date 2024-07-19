variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
}

variable "secret_id" {
  description = "The ID of the secret to create"
  type        = string
}

variable "secret_file_path" {
  description = "The path to the secret file"
  type        = string
}
