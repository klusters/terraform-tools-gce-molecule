provider "google" {

  project = var.project_id
  region  = var.region
}


data "google_compute_default_service_account" "default" {}
data "google_client_openid_userinfo" "me" {}


module "instance_template" {
  source     = "terraform-google-modules/vm/google//modules/instance_template"
  project_id = var.project_id
  service_account = {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    email  = data.google_compute_default_service_account.default.email
  }
  for_each    = var.instance_roles
  subnetwork           = each.value.subnetwork
  name_prefix          = each.value.instance_name
  source_image_family  = each.value.image
  source_image_project = each.value.image_project

  machine_type     = each.value.machine_type
  additional_disks = each.value.additional_disks
  labels           = each.value.labels
  preemptible = true
}

module "compute_instance" {
  source  = "terraform-google-modules/vm/google//modules/compute_instance"
  region  = var.region

  for_each    = var.instance_roles
  subnetwork        = each.value.subnetwork
  num_instances     = 1
  hostname          = each.value.instance_name
  instance_template = module.instance_template[each.key].self_link
  access_config = [{
    nat_ip       = var.nat_ip
    network_tier = var.network_tier
  }, ]

}
