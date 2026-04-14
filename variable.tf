variable "project_id" {
  description = "The GCP project where the VM will be deployed"
  type        = string
}

variable "name" {
  description = "Name of the VM instance"
  type        = string
  default     = "TestVM1"
}

variable "os_type" {
  description = "Either 'linux' or 'windows'"
  type        = string
  default     = "windows"
  
  validation {
    condition     = contains(["linux", "windows"], var.os_type)
    error_message = "os_type must be either 'linux' or 'windows'."
  }
}

variable "machine_type" {
  description = "GCP machine type"
  type        = string
  default     = "e2-micro"
}

variable "network_link" {
  description = "Self-link of the Shared VPC network (e.g., projects/HOST_PROJECT/global/networks/vpc-name)"
  type        = string
}

variable "subnetwork_link" {
  description = "Self-link of the Shared Subnet (e.g., projects/HOST_PROJECT/regions/asia-south1/subnetworks/subnet-name)"
  type        = string
}

variable "host_project_id" {
  description = "The host project ID where the Shared VPC is hosted"
  type        = string
}

variable "zone" {
  description = "GCP zone where the VM will be created"
  type        = string
  default     = "asia-south1-c"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "asia-south1"
}
