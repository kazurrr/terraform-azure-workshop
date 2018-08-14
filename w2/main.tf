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
