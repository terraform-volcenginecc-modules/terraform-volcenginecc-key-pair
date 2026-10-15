output "key_pair_names" {
  description = "Key pair names for caller-owned Linux ECS configurations."
  value       = module.key_pair.key_pair_names
}

output "fingerprints" {
  description = "Fingerprints for the imported operations and generated image-builder keys."
  value       = module.key_pair.fingerprints
}
