variable "operations_key_pair_name" {
  type        = string
  description = "Name for the imported operations public key."
  default     = "complete-operations-key"
}

variable "operations_public_key" {
  type        = string
  description = "OpenSSH public key to import for operations access. Supply it through a protected variable source."
  sensitive   = true
}

variable "operations_instance_ids" {
  type        = set(string)
  description = "Caller-owned Linux ECS instance IDs that this module attaches to the imported operations key."
  default     = []
}

variable "operations_rotation_generation" {
  type        = string
  description = "Increment or otherwise change this value to explicitly replace the imported operations key pair."
  default     = "2026-09"
}

variable "image_builder_key_pair_name" {
  type        = string
  description = "Name for the ECS-generated image-builder key."
  default     = "complete-image-builder-key"
}

variable "image_builder_instance_ids" {
  type        = set(string)
  description = "Caller-owned Linux ECS image-builder IDs that this module attaches to the generated key."
  default     = []
}

variable "reused_key_pair_name" {
  type        = string
  description = "Optional externally managed key pair name to read and reuse without taking ownership."
  default     = null
}

variable "project_name" {
  type        = string
  description = "Optional Volcengine project name."
  default     = "default"
}

variable "environment" {
  type        = string
  description = "Environment tag value."
  default     = "production"
}
