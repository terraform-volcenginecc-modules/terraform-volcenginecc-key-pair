module "key_pair" {
  source  = "terraform-volcenginecc-modules/key-pair/volcenginecc"
  version = "~> 1.0"

  key_pairs = {
    bastion = {
      key_pair_name = var.key_pair_name
      description   = "ECS-generated Linux bastion login key"
      project_name  = var.project_name
      tags = {
        Environment = var.environment
        ManagedBy   = "Terraform"
        Scenario    = "bastion-access"
      }
    }
  }
}
