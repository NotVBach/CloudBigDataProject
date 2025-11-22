variable "project" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "network_name" {
  description = "VPC network name"
  type        = string
  default     = "spark-vpc"
}

variable "machine_type" {
  description = "Machine type for VMs"
  type        = string
  default     = "n1-standard-2"
}

variable "image_family" {
  description = "Ubuntu image family"
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "ssh_user" {
  description = "SSH username"
  type        = string
  default     = "ubuntu"
}

variable "public_key_path" {
  description = "Path to public SSH key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "admin_ip" {
  description = "Admin IP address for SSH access"
  type        = string
}

variable "worker_count" {
  description = "Number of Spark worker nodes"
  type        = number
  default     = 2
}
