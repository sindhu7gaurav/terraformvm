resource "google_compute_instance" "vm" {
  name         = var.name
  project      = var.project_id
  machine_type = var.os_type == "windows" ? "e2-medium" : "e2-micro"
  zone         = "asia-south1-c"

  boot_disk {
    initialize_params {
      image = var.os_type == "windows" ? "windows-cloud/windows-2022" : "debian-cloud/debian-12"
    }
  }
network_interface {
    network    = var.network_link
    subnetwork = var.subnetwork_link
  }
  labels = {
    patch_group = "production"
    backup      = "daily"
  }
}
