output "sql_server_fqdn" {
  value = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "sql_connection_string" {
  description = "ADO.NET connection string для SQL Database"
  value       = "Server=tcp:${azurerm_mssql_server.sql_server.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.sql_db.name};User ID=${var.sql_admin_username};Password=${random_password.admin_password.result};Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  sensitive   = true
}