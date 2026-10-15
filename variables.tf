variable "key_pairs" {
  type = map(object({
    key_pair_name       = string
    public_key          = optional(string)
    description         = optional(string)
    project_name        = optional(string)
    instance_ids        = optional(set(string), [])
    tags                = optional(map(string), {})
    rotation_generation = optional(string, "initial")
  }))
  description = "Key pairs keyed by stable logical names. Omit public_key to create an ECS-generated RSA key pair; set it to import an existing public key. Changing a map key changes the Terraform resource address."

  validation {
    condition = alltrue([
      for key_pair in values(var.key_pairs) :
      can(regex("^[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?(?:\\.[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?)*$", key_pair.key_pair_name)) &&
      length(key_pair.key_pair_name) >= 2 &&
      length(key_pair.key_pair_name) <= 64 &&
      !strcontains(key_pair.key_pair_name, "--") &&
      !strcontains(key_pair.key_pair_name, "..")
    ])
    error_message = "Each key_pair_name must be 2 to 64 characters, contain only letters, numbers, hyphens, and dot-separated segments, and cannot start or end with a hyphen or dot."
  }

  validation {
    condition = alltrue([
      for key_pair in values(var.key_pairs) :
      key_pair.public_key == null ? true : can(regex(
        "^(ssh-(rsa|ed25519)|ecdsa-sha2-nistp(256|384|521)) (?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?(?: [^\\r\\n]+)?$",
        trimspace(key_pair.public_key)
      ))
    ])
    error_message = "public_key must be omitted for an ECS-generated key or be a valid one-line OpenSSH ssh-rsa, ssh-ed25519, or ecdsa-sha2-nistp public key."
  }

  validation {
    condition = alltrue([
      for key_pair in values(var.key_pairs) :
      key_pair.description == null ? true : length(key_pair.description) <= 255
    ])
    error_message = "description must not exceed 255 characters."
  }

  validation {
    condition = alltrue([
      for key_pair in values(var.key_pairs) :
      key_pair.project_name == null ? true : (
        length(key_pair.project_name) > 0 &&
        length(key_pair.project_name) <= 64 &&
        can(regex("^[A-Za-z0-9_.-]+$", key_pair.project_name))
      )
    ])
    error_message = "project_name must be 1 to 64 characters and contain only letters, numbers, underscores, periods, or hyphens."
  }

  validation {
    condition = alltrue([
      for key_pair in values(var.key_pairs) :
      alltrue([for tag_key in keys(key_pair.tags) : length(trimspace(tag_key)) > 0])
    ])
    error_message = "Tag keys must not be empty."
  }

  validation {
    condition     = length(distinct([for key_pair in values(var.key_pairs) : key_pair.key_pair_name])) == length(var.key_pairs)
    error_message = "Every managed key_pair_name must be unique."
  }
}

variable "existing_key_pair_names" {
  type        = map(string)
  description = "Externally managed key pair names keyed by stable logical names. The module reads them without taking ownership, so destroy never deletes the external key pairs."
  default     = {}

  validation {
    condition = alltrue([
      for key_pair_name in values(var.existing_key_pair_names) :
      can(regex("^[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?(?:\\.[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?)*$", key_pair_name)) &&
      length(key_pair_name) >= 2 &&
      length(key_pair_name) <= 64 &&
      !strcontains(key_pair_name, "--") &&
      !strcontains(key_pair_name, "..")
    ])
    error_message = "Each existing key pair name must meet ECS key-pair naming requirements."
  }

}

variable "expose_generated_private_keys" {
  type        = bool
  description = "Whether the sensitive generated_private_keys output contains ECS-generated private keys. Keep false unless the calling system can immediately place them in a protected secret store."
  default     = false
}
