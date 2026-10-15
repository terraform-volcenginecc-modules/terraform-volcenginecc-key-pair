resource "terraform_data" "rotation" {
  for_each = var.key_pairs

  input = each.value.rotation_generation

  lifecycle {
    precondition {
      condition     = !contains(values(var.existing_key_pair_names), each.value.key_pair_name)
      error_message = "A key pair name cannot be managed and externally referenced by this module at the same time."
    }
  }
}

data "volcenginecc_ecs_keypair" "existing" {
  for_each = var.existing_key_pair_names

  id = each.value
}

resource "volcenginecc_ecs_keypair" "this" {
  for_each = var.key_pairs

  key_pair_name = each.value.key_pair_name
  public_key    = each.value.public_key
  description   = each.value.description
  project_name  = each.value.project_name
  instance_ids  = length(each.value.instance_ids) == 0 ? null : each.value.instance_ids

  tags = [
    for tag_key, tag_value in each.value.tags : {
      key   = tag_key
      value = tag_value
    }
  ]

  lifecycle {
    replace_triggered_by = [
      terraform_data.rotation[each.key],
    ]
  }
}
