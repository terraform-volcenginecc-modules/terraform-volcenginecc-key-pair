output "key_pairs" {
  description = "Non-sensitive managed key pair metadata keyed by the input key_pairs map key."
  value = {
    for key, key_pair in volcenginecc_ecs_keypair.this : key => {
      id            = key_pair.id
      key_pair_id   = key_pair.key_pair_id
      key_pair_name = key_pair.key_pair_name
      finger_print  = key_pair.finger_print
      instance_ids  = key_pair.instance_ids
      created_time  = key_pair.created_time
      updated_time  = key_pair.updated_time
    }
  }
}

output "key_pair_names" {
  description = "Managed and externally referenced key pair names keyed by their input map keys; use these names when configuring a Linux ECS instance."
  value = merge(
    { for key, key_pair in volcenginecc_ecs_keypair.this : key => key_pair.key_pair_name },
    { for key, key_pair in data.volcenginecc_ecs_keypair.existing : key => key_pair.key_pair_name }
  )
}

output "fingerprints" {
  description = "Public-key fingerprints for managed and externally referenced key pairs, keyed by their input map keys."
  value = merge(
    { for key, key_pair in volcenginecc_ecs_keypair.this : key => key_pair.finger_print },
    { for key, key_pair in data.volcenginecc_ecs_keypair.existing : key => key_pair.finger_print }
  )
}

output "existing_key_pairs" {
  description = "Non-sensitive metadata for externally managed key pairs. These are data-source reads only and are never deleted by this module."
  value = {
    for key, key_pair in data.volcenginecc_ecs_keypair.existing : key => {
      key_pair_id   = key_pair.key_pair_id
      key_pair_name = key_pair.key_pair_name
      finger_print  = key_pair.finger_print
      instance_ids  = key_pair.instance_ids
    }
  }
}

output "generated_private_keys" {
  description = "ECS-generated private keys keyed by input key. Null unless expose_generated_private_keys is true. This output is sensitive and must be stored in an approved secret manager immediately."
  sensitive   = true
  value = var.expose_generated_private_keys ? {
    for key, key_pair in volcenginecc_ecs_keypair.this :
    key => key_pair.private_key if var.key_pairs[key].public_key == null
  } : null
}
