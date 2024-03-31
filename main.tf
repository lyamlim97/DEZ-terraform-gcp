terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.22.0"
    }
  }
}

provider "google" {
  credentials = "keys/my-creds.json"
  project     = "dtc-dez-418818"
  region      = "asia-southeast1"
}


resource "google_storage_bucket" "demo-bucket" {
  name          = "dtc-dez-418818-terra-bucket"
  location      = "asia-southeast1"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
