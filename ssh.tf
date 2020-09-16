module "ssh-key-pair" {
  source                = "cloudposse/ssh-key-pair/tls"
  version               = "0.2.0"
  namespace             = "github"
  stage                 = "ci"
  name                  = var.ssh_key_name
  ssh_public_key_path   = "/opt/hostedtoolcache"
  private_key_extension = ".pem"
  public_key_extension  = ".pub"
  chmod_command         = "chmod 600 %v"
}