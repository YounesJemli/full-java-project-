terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.38"
    }
    external = {
      source  = "hashicorp/external"
      version = "~> 2.3"
    }
  }
}
