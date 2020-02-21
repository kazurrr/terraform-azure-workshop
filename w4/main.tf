resource azurerm_resource_group workshop {
  name     = "${var.prefix}-workshop-rg"
  location = var.location
}

module function_app {
  source = "./function-app"

  prefix              = var.prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.workshop.name
}

resource null_resource nodejs_function {
  provisioner local-exec {
    command = "az functionapp deployment source config-zip --src '../function-app/function-app-hello-world.zip' --resource-group ${azurerm_resource_group.workshop.name} --name ${module.function_app.function_app_name}"
  }
}
