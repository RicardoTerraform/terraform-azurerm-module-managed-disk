data "azurerm_resource_group" "rgname" {
  name = "${var.azure_system_name}-rg-${var.environment}"
}

data "azurerm_virtual_machine" "virtualmachine" {
  name                = "${var.azure_system_name}-${var.vm_name}-${var.environment}"
  resource_group_name = data.azurerm_resource_group.rgname.name
}