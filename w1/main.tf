provider "azurerm" {
  client_id       = "3820ac58-709a-4b40-aad8-8d5357b18fd6"
  client_secret   = ""
  tenant_id       = "7b8f13dd-eb5f-4f9a-a941-1a9471c8b985"
  subscription_id = "7ea86c73-51c0-464b-ac07-53533a3adfda"
}

variable "bank_password" {
  type        = "string"
  description = "Podaj hasło do banku"
}

resource "azurerm_resource_group" "infrastructure" {
  name     = "workshop-rg"
  location = "westus"
}

output "test output" {
  value = "Hello world: ${var.bank_password}"
}
