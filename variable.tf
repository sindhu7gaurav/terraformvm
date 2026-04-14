variable "project_id" {
  description = "The project where this specific VM will be deployed"
  type        = string
}

variable "name" {
  description = "Name of the VM instance"
  type        = string
}

variable "os_type" {
  description = "Either 'linux' or 'windows'"
  type        = string
}

variable "network_link" {
  description = "Self-link of the Shared VPC"
  type        = string
}

variable "subnetwork_link" {
  description = "Self-link of the Shared Subnet"
  type        = string
}

variable "zone" {
  type    = string
  default = "asia-south1-c"
}
