resource "azurerm_storage_account" "workshop" {
  name                     = "${var.prefix}functionappsa"
  resource_group_name      = "${var.resource_group_name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "workshop" {
  name                = "${var.prefix}-app-service-plan"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "workshop" {
  name                      = "${var.prefix}-azure-functions"
  location                  = "${var.location}"
  resource_group_name       = "${var.resource_group_name}"
  app_service_plan_id       = "${azurerm_app_service_plan.workshop.id}"
  storage_connection_string = "${azurerm_storage_account.workshop.primary_connection_string}"

  app_settings {
    "NAME" = "${var.prefix}"
  }
}
