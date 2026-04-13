provider "google" {
  project     = "prabhat-new-project-2026"   # 👈 replace with your real project ID
  region      = "us-central1"
  credentials = var.gcp_credentials
}

variable "gcp_credentials" {
  type = string
}

# Enable required APIs
resource "google_project_service" "compute_api" {
  project = "prabhat-new-project-2026"
  service = "compute.googleapis.com"

  disable_on_destroy = false
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-testvm"
  machine_type = "e2-medium"
  zone         = "us-central1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
