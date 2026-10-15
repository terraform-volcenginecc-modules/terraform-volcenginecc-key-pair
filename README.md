# terraform-volcenginecc-key-pair

## Overview

Terraform module for managing Volcengine KEY PAIR resources with the `volcenginecc` provider. The caller owns provider authentication, region configuration, and external resources passed by ID.

## Usage

```hcl
module "key_pair" {
  source  = "terraform-volcenginecc-modules/key-pair/volcenginecc"
  version = "~> 1.0"

  # Set the required module inputs for your environment.
}
```

## Requirements

| Name | Version |
|---|---|
| Terraform | `>= 1.5.7` |
| OpenTofu | `>= 1.11.8` |

## Providers

| Name | Source |
|---|---|
| `volcenginecc` | `volcengine/volcenginecc` |

## Resources

| Name | Description |
|---|---|
| `terraform_data` | Module-defined terraform_data. |
| `volcenginecc_ecs_keypair` | Module-defined volcenginecc_ecs_keypair. |
| `volcenginecc_ecs_keypair` | Module-defined volcenginecc_ecs_keypair. |

## Inputs

| Name | Description |
|---|---|
| `key_pairs` | Module-defined key_pairs. |
| `existing_key_pair_names` | Module-defined existing_key_pair_names. |
| `expose_generated_private_keys` | Module-defined expose_generated_private_keys. |

## Outputs

| Name | Description |
|---|---|
| `key_pairs` | Module-defined key_pairs. |
| `key_pair_names` | Module-defined key_pair_names. |
| `fingerprints` | Module-defined fingerprints. |
| `existing_key_pairs` | Module-defined existing_key_pairs. |
| `generated_private_keys` | Module-defined generated_private_keys. |

## Examples

- `basic`: independently runnable basic configuration.
- `complete`: independently runnable complete configuration.

## Notes

- Configure credentials using supported provider mechanisms; do not put access keys in module files.
- Review replacement behavior and provider constraints before applying changes.
- Run `terraform plan` after apply and confirm that the second plan has no changes.
