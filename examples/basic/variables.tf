variable "key_pair_name" {
  type        = string
  description = "Name for the ECS-generated key pair."
  default     = "basic-bastion-key"
}

variable "project_name" {
  type        = string
  description = "Optional Volcengine project name."
  default     = "default"
}

variable "environment" {
  type        = string
  description = "Environment tag value."
  default     = "development"
}
