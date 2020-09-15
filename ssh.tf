module "ssh-key-pair" {
  source                = "cloudposse/ssh-key-pair/tls"
  version               = "0.2.0"
  namespace             = "eg"
  stage                 = "test"
  name                  = "molecule"
  ssh_public_key_path   = "/opt/hostedtoolcache"
  private_key_extension = ".pem"
  public_key_extension  = ".pub"
  chmod_command         = "chmod 600 %v"
}