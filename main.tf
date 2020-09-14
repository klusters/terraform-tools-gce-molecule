provider "google" {

  project = var.project_id
  region  = var.region
  version = "~> 3.0"
}


data "google_compute_default_service_account" "default" {
}

module "instance_template" {
  source     = "terraform-google-modules/vm/google//modules/instance_template"
  version    = "4.0.0"
  project_id = var.project_id
  subnetwork = var.subnetwork
  service_account = {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    email  = data.google_compute_default_service_account.default.email
  }

  name_prefix          = var.instance_name
  preemptible          = true
  source_image_family  = var.image
  source_image_project = var.image_project

  machine_type = var.machine_type
  additional_disks = var.additional_disks
  metadata = {
    ssh-keys = "afathallah:${module.ssh-key-pair.public_key}"
  }
}

module "compute_instance" {
  source            = "terraform-google-modules/vm/google//modules/compute_instance"
  version           = "4.0.0"
  region            = var.region
  subnetwork        = var.subnetwork
  num_instances     = 1
  hostname          = var.instance_name
  instance_template = module.instance_template.self_link
  access_config = [{
    nat_ip       = var.nat_ip
    network_tier = var.network_tier
  }, ]

}
