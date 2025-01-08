output "tenant_id" {
  value = data.azuread_client_config.current.tenant_id
}

output "client_id" {
  value = azuread_application.ad_app_registration.application_id    
}

output "client_secret" {
  value = nonsensitive(azuread_application_password.password.value)
  # sensitive = true
}