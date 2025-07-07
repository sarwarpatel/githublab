resource "azurerm_mssql_server" "mssql" {
  name                         = var.mssql_server_name
  resource_group_name          = var.rg_name
  location                     = var.location
    version                      = "12.0"
#   administrator_login          = "missadministrator"
#   administrator_login_password = "thisIsKat11"
#   minimum_tls_version          = "1.2"

#   azuread_administrator {
#     login_username = "AzureAD Admin"
#     object_id      = "00000000-0000-0000-0000-000000000000"
    }

resource "azurerm_mssql_database" "mssql_db" {
  name         = var.mssql_db_name
  server_id    = azurerm_mssql_server.example.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
  }

  

