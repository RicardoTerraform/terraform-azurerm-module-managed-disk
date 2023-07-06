data "azurerm_resource_group" "rgname" {
  name = "${var.azure_system_name}-rg-${var.vm_environment}"
}