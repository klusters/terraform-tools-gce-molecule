variable "region" {
  description = "Region for cloud resources"
  default     = "europe-west3"
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

variable "additional_disks" {
  description = "List of maps of additional disks. See https://www.terraform.io/docs/providers/google/r/compute_instance_template.html#disk_name"
  type = list(object({
    auto_delete  = bool
    boot         = bool
    disk_size_gb = number
    disk_type    = string
  }))
  default = []
}