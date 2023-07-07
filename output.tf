output "disk_id" {
  value = local.disk_id
}

output "disk_attach_id" {
  value = azurerm_virtual_machine_data_disk_attachment.disk_attachment[0].id
}

output "disk_name" {
  value = local.manage_disk_normal ? azurerm_managed_disk.manage_disk[0].id : azurerm_managed_disk.manage_disk_ultra_PV2[0].id
}
