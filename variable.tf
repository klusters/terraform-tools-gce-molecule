variable "region" {
  description = "Region for cloud resources"
  default     = "europe-west3"
}

variable "project_id" {
  type        = string
  description = "The GCP project ID"
  default     = null
}

variable "instance_name" {
  description = "Name of the instacne to create"
  default     = "default"
}

variable "image" {
  description = "Name of the instacne to create"
  default     = "centos-7"
}

variable "image_project" {
  description = "Name of the instacne to create"
  default     = "centos-cloud"
}

variable "network" {
  description = "Name of the vpc network to create resources in"
  default     = "default"
}

variable "subnetwork" {
  default = "default"
}

variable "nat_ip" {
  description = "Public ip address"
  default     = null
}

variable "network_tier" {
  description = "Network network_tier"
  default     = "PREMIUM"
}

variable "machine_type" {
  description = "Instance type"
  default     = "n1-standard-1"
}
