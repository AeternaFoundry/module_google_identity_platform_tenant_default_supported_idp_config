resource "google_identity_platform_tenant_default_supported_idp_config" "identity_platform_tenant_default_supported_idp_configs" {
  for_each = var.identity_platform_tenant_default_supported_idp_configs

  client_id       = each.value.client_id
  client_secret   = each.value.client_secret
  idp_id          = each.value.idp_id
  tenant          = each.value.tenant
  deletion_policy = each.value.deletion_policy
  enabled         = each.value.enabled
  project         = each.value.project

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

