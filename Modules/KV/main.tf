# Create a key vault with access policies which allow for the current user to get, list, create, delete, update, recover, purge and getRotationPolicy for the key vault key and also add a key vault access policy for the Microsoft Sql Server instance User Managed Identity to get, wrap, and unwrap key(s)



resource "azurerm_key_vault" "kv" {
  name                        = var.kv_name
  location                    = var.location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_key_vault.data-kv.tenant_id
  sku_name = "standard"

#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = true

  

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     key_permissions = ["Get", "List", "Create", "Delete", "Update", "Recover", "Purge", "GetRotationPolicy"]
#   }

#   access_policy {
#     tenant_id = azurerm_user_assigned_identity.example.tenant_id
#     object_id = azurerm_user_assigned_identity.example.principal_id

#     key_permissions = ["Get", "WrapKey", "UnwrapKey"]
#   }
}

