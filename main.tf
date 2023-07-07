#Normal Manage disk (Standar, Premium)
resource "azurerm_managed_disk" "manage_disk" {
  count = local.manage_disk_normal ? 1 : 0

  name                = "${var.azure_system_name}-${var.name_disk}-osdisk-${var.environment}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rgname.name

  storage_account_type = var.os_storage_account_type
  disk_size_gb         = var.os_disk_size_gb != null ? [for size in local.disks_tiers[split("_", var.os_storage_account_type)[0]] : size if size >= var.os_disk_size_gb][0] : null
  #disk_size_gb         = split("_", var.os_storage_account_type)[0] != "PremiumV2" ? [for size in local.disks_tiers[split("_", var.os_storage_account_type)[0]] : size if size >= var.os_disk_size_gb][0] : var.os_disk_size_gb

  create_option      = var.creation
  source_uri         = contains(["Import", "ImportSecure"], var.creation) ? var.source_uri : null
  source_resource_id = contains(["Copy", "Restore"], var.creation) ? var.source_resource_id : null

  image_reference_id         = contains(["FromImage"], var.creation) ? var.gallery_image_reference_id != null ? null : var.image_reference_id : null
  gallery_image_reference_id = contains(["FromImage"], var.creation) ? var.image_reference_id != null ? null : var.gallery_image_reference_id : null

  upload_size_bytes = contains(["Upload"], var.creation) ? var.upload_size_bytes : null

  #edge_zone = ?

  os_type = contains(["Import", "ImportSecure", "Copy"], var.os_type) ? var.os_type : null

  max_shares = var.maximum_shares
  zone       = var.vm_avail_zone_id

  dynamic "encryption_settings" {
    for_each = var.disk_encryption_secret != null ? ["true"] : var.key_encryption_key != null ? ["true"] : []
    content {

      dynamic "disk_encryption_key" {
        for_each = var.disk_encryption_secret != null ? ["true"] : []

        content {
          source_vault_id = var.disk_encryption_secret["source_vault_id"]
          secret_url      = var.disk_encryption_secret["secret_url"]
        }
      }

      dynamic "key_encryption_key" {
        for_each = var.key_encryption_key != null ? ["true"] : []
        content {
          source_vault_id = var.key_encryption_key["source_vault_id"]
          key_url         = var.key_encryption_key["key_url"]
        }
      }
    }
  }

  tags = merge(local.tags_default, var.tags)

}

#Manage disk for Ultra SSD and PremiumV2
resource "azurerm_managed_disk" "manage_disk_ultra_PV2" {
  count = local.manage_disk_normal ? 0 : 1

  name                = "${var.azure_system_name}-${var.name_disk}-osdisk-${var.environment}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rgname.name

  storage_account_type = var.os_storage_account_type
  disk_size_gb         = var.os_disk_size_gb

  create_option = var.creation

  #ONLY settable for "UltraSSD" and "PremiumV2
  disk_iops_read_write = contains(["UltraSSD", "PremiumV2"], var.os_storage_account_type) ? var.disk_iops_read_write : null
  disk_mbps_read_write = contains(["UltraSSD", "PremiumV2"], var.os_storage_account_type) ? var.disk_mbps_read_write : null
  disk_iops_read_only  = contains(["UltraSSD", "PremiumV2"], var.os_storage_account_type) ? var.disk_iops_read_only : null
  disk_mbps_read_only  = contains(["UltraSSD", "PremiumV2"], var.os_storage_account_type) ? var.disk_mbps_read_only : null
  logical_sector_size  = var.logical_sector_size

  #edge_zone = ?

  max_shares = var.maximum_shares
  zone       = var.vm_avail_zone_id

  dynamic "encryption_settings" {
    for_each = var.disk_encryption_secret != null ? ["true"] : var.key_encryption_key != null ? ["true"] : []
    content {

      dynamic "disk_encryption_key" {
        for_each = var.disk_encryption_secret != null ? ["true"] : []

        content {
          source_vault_id = var.disk_encryption_secret["source_vault_id"]
          secret_url      = var.disk_encryption_secret["secret_url"]
        }
      }

      dynamic "key_encryption_key" {
        for_each = var.key_encryption_key != null ? ["true"] : []
        content {
          source_vault_id = var.key_encryption_key["source_vault_id"]
          key_url         = var.key_encryption_key["key_url"]
        }
      }
    }
  }

  tags = merge(local.tags_default, var.tags)
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk_attachment" {
  count = var.disk_attach ? 1 : 0

  managed_disk_id           = local.disk_id
  virtual_machine_id        = data.azurerm_virtual_machine.virtualmachine.id
  lun                       = var.lun
  caching                   = var.caching
  create_option             = contains(["Empty"], var.creation) ? var.creation : "Attach"
  write_accelerator_enabled = var.write_accelerator_enabled
}