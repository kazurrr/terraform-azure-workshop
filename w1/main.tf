variable "prefix" {
  type        = "string"
  description = "Pierwsza litera imienia i nazwisko pisane łącznie."
}

variable "location" {
  type    = "string"
  default = "westus"
}

resource "azurerm_resource_group" "workshop" {
  name     = "${var.prefix}-workshop-rg"
  location = "${var.location}"
}

output "resource_group_name" {
  value = "${azurerm_resource_group.workshop.name}"
}
