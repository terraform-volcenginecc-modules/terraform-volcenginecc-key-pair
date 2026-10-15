# terraform-volcenginecc-key-pair

## 概述

基于 `volcenginecc` Provider 管理火山引擎 KEY PAIR 资源的 Terraform 模块。调用方负责 Provider 凭据、地域配置，以及通过 ID 传入的外部资源。

## 用法

```hcl
module "key_pair" {
  source  = "terraform-volcenginecc-modules/key-pair/volcenginecc"
  version = "~> 1.0"

  # 请设置适用于当前环境的必填模块输入。
}
```

## 依赖要求

| 名称 | 版本 |
|---|---|
| Terraform | `>= 1.5.7` |
| OpenTofu | `>= 1.11.8` |

## Providers

| 名称 | 来源 |
|---|---|
| `volcenginecc` | `volcengine/volcenginecc` |

## 资源

| 名称 | 说明 |
|---|---|
| `terraform_data` | 模块定义的 terraform_data。 |
| `volcenginecc_ecs_keypair` | 模块定义的 volcenginecc_ecs_keypair。 |
| `volcenginecc_ecs_keypair` | 模块定义的 volcenginecc_ecs_keypair。 |

## 输入

| 名称 | 说明 |
|---|---|
| `key_pairs` | 模块定义的 key_pairs。 |
| `existing_key_pair_names` | 模块定义的 existing_key_pair_names。 |
| `expose_generated_private_keys` | 模块定义的 expose_generated_private_keys。 |

## 输出

| 名称 | 说明 |
|---|---|
| `key_pairs` | 模块定义的 key_pairs。 |
| `key_pair_names` | 模块定义的 key_pair_names。 |
| `fingerprints` | 模块定义的 fingerprints。 |
| `existing_key_pairs` | 模块定义的 existing_key_pairs。 |
| `generated_private_keys` | 模块定义的 generated_private_keys。 |

## 示例

- `basic`：可独立运行的 basic 配置。
- `complete`：可独立运行的 complete 配置。

## 说明

- 请通过 Provider 支持的方式配置凭据，不要将访问密钥写入模块文件。
- 执行变更前请审阅替换行为及 Provider 限制。
- apply 后请再次执行 `terraform plan`，并确认第二次 plan 无变更。
