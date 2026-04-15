terraform {
  backend "gcs" {
    bucket = "terraform-state-sindhu"
    prefix = "terraform/state"
  }
}
