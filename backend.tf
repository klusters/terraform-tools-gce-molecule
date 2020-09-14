terraform {
  backend "gcs" {
    bucket = "feisty-catcher-261412_terraform_tfstate"
    prefix = "env/molecule"
  }
}