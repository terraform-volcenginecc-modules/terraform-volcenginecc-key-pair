# COMPLETE KEY PAIR Example

## Overview

Runnable complete configuration for the KEY PAIR module. It configures the provider from input variables and calls the published Registry module.

## Usage

```shell
terraform init
terraform plan
terraform apply
terraform plan
terraform destroy
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
| `terraform-volcenginecc-modules/key-pair/volcenginecc` | Published KEY PAIR module. |

## Inputs

| Name | Description |
|---|---|
| `operations_key_pair_name` | Module-defined operations_key_pair_name. |
| `operations_public_key` | Module-defined operations_public_key. |
| `operations_instance_ids` | Module-defined operations_instance_ids. |
| `operations_rotation_generation` | Module-defined operations_rotation_generation. |
| `image_builder_key_pair_name` | Module-defined image_builder_key_pair_name. |
| `image_builder_instance_ids` | Module-defined image_builder_instance_ids. |
| `reused_key_pair_name` | Module-defined reused_key_pair_name. |
| `project_name` | Module-defined project_name. |
| `environment` | Module-defined environment. |

## Outputs

| Name | Description |
|---|---|
| `key_pair_names` | Module-defined key_pair_names. |
| `fingerprints` | Module-defined fingerprints. |

## Examples

This directory is the complete example.

## Notes

- Supply credentials through supported provider configuration, never in source files.
- The final plan after apply must report no changes before the configuration is accepted.
