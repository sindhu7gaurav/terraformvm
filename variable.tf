variable "project_id" {
  description = "The project where this specific VM will be deployed"
  type        = string
  default = "prabhat-new-project-2026"
}

variable "name" {
  description = "Name of the VM instance"
  default = "TestVM1"
}

variable "os_type" {
  description = "Either 'linux' or 'windows'"
  default = "windows"
}

variable "network_link" {
  description = "Self-link of the Shared VPC"
  default = "google_compute_network.shared_vpc.self_link"
}

variable "subnetwork_link" {
  description = "Self-link of the Shared Subnet"
default = "google_compute_subnetwork.subnet.id"
}

variable "zone" {
  type    = string
  default = "asia-south1-c"
}

variable "region" {
 default = "asia-south1"
}

variable "gcp_credentials" {
  description = "GCP service account credentials JSON"
  type        = string
  sensitive   = true
}
