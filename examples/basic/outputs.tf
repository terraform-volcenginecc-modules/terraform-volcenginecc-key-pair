output "key_pair_name" {
  description = "Name to supply to a Linux ECS instance key_pair configuration."
  value       = module.key_pair.key_pair_names.bastion
}

output "fingerprint" {
  description = "Fingerprint of the generated ECS key pair."
  value       = module.key_pair.fingerprints.bastion
}
