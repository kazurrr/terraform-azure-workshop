provider "azurerm" {
  client_id       = "3820ac58-709a-4b40-aad8-8d5357b18fd6"
  client_secret   = ""
  tenant_id       = "7b8f13dd-eb5f-4f9a-a941-1a9471c8b985"
  subscription_id = "7ea86c73-51c0-464b-ac07-53533a3adfda"
}

variable "prefix" {
  type        = "string"
  description = "Pierwsza litera imienia i nazwisko pisane łącznie."
}

variable "location" {
  type    = "string"
  default = "westus"
}

resource "azurerm_resource_group" "test" {
  name     = "${vat.prefix}-functionapp-rg"
  location = "${var.location}"
}

resource "azurerm_storage_account" "test" {
  name                     = "${var.prefix}functionapp"
  resource_group_name      = "${azurerm_resource_group.test.name}"
  location                 = "${azurerm_resource_group.test.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
