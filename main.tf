provider "google" {
  project     = "diesel-equator-491908-q2"   # 👈 replace with your real project ID
  region      = "us-central1"
  credentials = var.gcp_credentials
}

variable "gcp_credentials" {
  type = string
}

# Enable required APIs
resource "google_project_service" "compute_api" {
  project = "diesel-equator-491908-q2"
  service = "compute.googleapis.com"

  disable_on_destroy = false
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

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
