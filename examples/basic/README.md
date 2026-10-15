# BASIC KEY PAIR Example

## Overview

Runnable basic configuration for the KEY PAIR module. It configures the provider from input variables and calls the published Registry module.

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
| `key_pair_name` | Module-defined key_pair_name. |
| `project_name` | Module-defined project_name. |
| `environment` | Module-defined environment. |

## Outputs

| Name | Description |
|---|---|
| `key_pair_name` | Module-defined key_pair_name. |
| `fingerprint` | Module-defined fingerprint. |

## Examples

This directory is the basic example.

## Notes

- Supply credentials through supported provider configuration, never in source files.
- The final plan after apply must report no changes before the configuration is accepted.
