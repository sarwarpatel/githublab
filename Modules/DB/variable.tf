variable "mssql_server_name" {
  description = "The name of the MSSQL server."
}

variable "rg_name" {
  description = "The name of the resource group."
}

variable "location" {
  description = "The Azure region where the resources will be created."
}

variable "mssql_db_name" {
  description = "The name of the MSSQL server"
  type        = string
}
