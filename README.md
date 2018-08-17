
# Wprowadzenie do Terraform z wykorzystaniem platformy Azure

##### Karol Masuhr

###### #terraform #azure #serverless #awesomeness #rkś

---

### Po co to?

Celem szkolenia jest poznanie narzędzia **Terraform** na przykładzie tworzenia środowiska serverless w Azure.

---

### Wymagania:

* **terraform** - https://www.terraform.io/intro/getting-started/install.html
* **azure cli** - https://docs.microsoft.com/pl-pl/cli/azure/install-azure-cli?view=azure-cli-latest
* **vscode** - https://code.visualstudio.com/
* Wtyczka do vscode **vscode-terraform** - https://marketplace.visualstudio.com/items?itemName=mauve.terraform
* Znajomość **memów** na poziomie podstawowym

---

### Co to jest ten Ażur?

#### TODO

<!-- 
* Function App
-->

![There is no cloud](https://tr1.cbsistatic.com/hub/i/2016/05/09/ede8a826-e9b0-49e4-a196-fc0e2c72f561/7e6a8dbffea824c9cf3d8b45a66fb13f/49nocloud.jpg)

---

### Co to jest ten Terraform

https://www.terraform.io/docs/providers/azurerm/

---

### Preparation

###### Azure Portal signin

http://portal.azure.com

| Username       | Password          |
| -------------- | ----------------- |
| spam@masuhr.pl | Spójrz na tablicę |

###### Azure CLI login

1. `az login`
2. Wybranie konta w otwartym oknie przeglądarki

---

### Workshop #1

<!--
`terraform init`
`terraform plan`
`terraform apply`
-->

###### Cel

1. Zapoznanie się z podstawowymi elementami Terraforma.
	* variable
	* resource
	* output
2. Parametryzacja pierwszej infrastruktury - dodanie prefixu do nazwu **Resource groupy**, prefix powinien być podawany jako **input variable**.
3. Wypisanie na konsolę nazwy stworzonej **Resource groupy**

---

### Workshop #2

###### Cel

Stworzyć **Function App** przy użyciu narzędzia terraform. Zadanie zostaje zaliczone jeśli na koniec działania otrzymamy url działającego Function Appa.

###### Zasoby do utworzenia

* Resource Group
    * location: `westus`
* Storage Account
    * account_tier: `Standard`
    * account_replication_type: `LRS`
* App Service Plan
	* sku: `{tier = "Standard", size = "S1"}` 
* Function App

---

### Workshop #3

###### Cel

Deployment appki *Hello world* w nodeJS przy pomocy **Azure CLI** i **Terraform**

![Meme2](https://mariusbancila.ro/blog/wp-content/uploads/2017/10/nodeazure.jpg)

###### Azure CLI

`az functionapp deployment source config-zip --src 'function-app-hello-world.zip' --resource-group $RESOURCE_GROUP --name $FUNCTION_APP_NAME`

---

### Workshop #3

###### Terraform

Użycie polecenia **Azure CLI** wewnątrz Terraforma. Do tego celu użujemy `null_resource`.

```
resource "null_resource" "helloworld_function" {
  provisioner "local-exec" {
    command = "az functionapp deployment...
  }
}
```
---

### Workshop #4

###### Cel - modularyzacja

1. Wydzielenie z głównego pliku elementów odpowiedzialnych za **zamienne (variables)** i **wyjścia (outputs)**

![part_1](.img/part_1.png)

2. Stworzenie modułu `function-app` zawierającego: `azurerm_storage_account` `azurerm_app_service_plan` oraz `azurerm_function_app`

![alt text](.img/part_2.png "Title")

---

### Linki

https://chmurowisko.pl/serwisy-microsoft-azure/

https://www.terraform.io/docs/configuration/index.html

https://www.terraform.io/docs/providers/azurerm/index.html

---

# Koniec
### ToDo mem na koniec
