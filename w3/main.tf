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

resource "azurerm_storage_account" "workshop" {
  name                     = "${var.prefix}functionappsa"
  resource_group_name      = "${azurerm_resource_group.workshop.name}"
  location                 = "${azurerm_resource_group.workshop.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "workshop" {
  name                = "${var.prefix}-app-service-plan"
  location            = "${azurerm_resource_group.workshop.location}"
  resource_group_name = "${azurerm_resource_group.workshop.name}"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "workshop" {
  name                      = "${var.prefix}-azure-functions"
  location                  = "${azurerm_resource_group.workshop.location}"
  resource_group_name       = "${azurerm_resource_group.workshop.name}"
  app_service_plan_id       = "${azurerm_app_service_plan.workshop.id}"
  storage_connection_string = "${azurerm_storage_account.workshop.primary_connection_string}"

  app_settings {
    "NAME" = "${var.prefix}"
  }
}

resource "null_resource" "nodejs_function" {
  provisioner "local-exec" {
    command = "az functionapp deployment source config-zip --src 'function-app-hello-world.zip' --resource-group ${azurerm_resource_group.workshop.name} --name ${azurerm_function_app.workshop.name}"
  }
}

output "function_app_url" {
  value = "https://${azurerm_function_app.workshop.default_hostname}"
}

output "function_url" {
  value = "https://${azurerm_function_app.workshop.default_hostname}/api/function-app-hello-world"
}
