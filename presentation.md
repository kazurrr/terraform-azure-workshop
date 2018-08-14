<!-- $theme: default -->

# Terraform and Azure
###### Karol Masuhr

---

### Agenda

1. Wymagania
2. Wprowadzenie do Azure Cloud
3. Stworzenie własnego serwisu (rg + app_service) z portalu Azure
4. Piękne zadania

---

### Wymagane oprogramowanie:

* **terraform** - https://www.terraform.io/intro/getting-started/install.html
* **azure cli** - https://docs.microsoft.com/pl-pl/cli/azure/install-azure-cli?view=azure-cli-latest
* **vscode** - https://code.visualstudio.com/
* Wtyczka do vscode **vscode-terraform** - https://marketplace.visualstudio.com/items?itemName=mauve.terraform
* Znajomość **memów** na poziomie podstawowym

---

### Co to jest ten Ażur?

#### TODO

![There is no cloud](https://tr1.cbsistatic.com/hub/i/2016/05/09/ede8a826-e9b0-49e4-a196-fc0e2c72f561/7e6a8dbffea824c9cf3d8b45a66fb13f/49nocloud.jpg)

---

### App Service

---

### Workshop #1

###### Cel

1. Zapoznanie się z podstawowymi elementami Terraforma.
	* variable
	* resource
	* output
2. Parametryzacja pierwszej infrastruktury - dodanie prefixu do nazwu **Resource groupy**, prefix powinien być podawany jako **input variable**.
3. Wypisanie na konsolę nazwy stworzonej **Resource groupy**

---

### Zasady

1. Wszystkie zasoby utworzone muszą mieć nazwę autora w nazwie (np. `kmasuhr-workshop-rg`).
2. Po każdym zadaniu niszczymy stworzoną infrastrukturę: `terraform destroy`.

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

###### Azure CLI

`az functionapp deployment source config-zip --src 'function-app-hello-world.zip' --resource-group $RESOURCE_GROUP --name $FUNCTION_APP_NAME`

![Meme2](https://mariusbancila.ro/blog/wp-content/uploads/2017/10/nodeazure.jpg)
