module "key_pair" {
  source  = "terraform-volcenginecc-modules/key-pair/volcenginecc"
  version = "~> 1.0"

  key_pairs = {
    operations = {
      key_pair_name       = var.operations_key_pair_name
      public_key          = var.operations_public_key
      description         = "Imported operations public key for Linux ECS access"
      project_name        = var.project_name
      instance_ids        = var.operations_instance_ids
      rotation_generation = var.operations_rotation_generation
      tags = {
        Environment = var.environment
        ManagedBy   = "Terraform"
        Role        = "operations"
      }
    }

    image_builder = {
      key_pair_name = var.image_builder_key_pair_name
      description   = "ECS-generated key for image-build automation"
      project_name  = var.project_name
      instance_ids  = var.image_builder_instance_ids
      tags = {
        Environment = var.environment
        ManagedBy   = "Terraform"
        Role        = "image-builder"
      }
    }
  }

  existing_key_pair_names = var.reused_key_pair_name == null ? {} : {
    reused = var.reused_key_pair_name
  }
}
