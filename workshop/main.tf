variable bank_password {
  type        = string
  description = "Podaj hasło do banku"
}

resource azurerm_resource_group workshop {
  name     = "workshop-rg"
  location = "westus"
}

output test_output {
  value = "Hello world: ${var.bank_password}"
}
