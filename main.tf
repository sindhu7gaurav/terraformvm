resource "google_compute_instance" "vm" {
  name         = var.name
  project      = var.project_id
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.os_type == "windows" ? "windows-cloud/windows-2022" : "debian-cloud/debian-12"
      size  = 50
    }
  }

  network_interface {
    network            = var.network_link
    subnetwork         = var.subnetwork_link
    network_project    = var.host_project_id
    access_config {}
  }

  labels = {
    patch_group = "production"
    backup      = "daily"
  }

  tags = ["http-server", "https-server"]
}

output "instance_self_link" {
  description = "The self link of the created instance"
  value       = google_compute_instance.vm.self_link
}

output "instance_internal_ip" {
  description = "The internal IP address of the instance"
  value       = google_compute_instance.vm.network_interface[0].network_ip
}

output "instance_external_ip" {
  description = "The external IP address of the instance"
  value       = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
}
