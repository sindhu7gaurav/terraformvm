provider "google" {
  project     = "diesel-equator-491908-q2"   # 👈 replace with your real project ID
  region      = "us-central1"
  credentials = jsondecode(var.gcp_credentials)
}

variable "gcp_credentials" {
  type = string
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
