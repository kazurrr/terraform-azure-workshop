output function_url {
  value = "https://${module.function_app.function_app_default_hostname}/api/function-app-hello-world"
}
