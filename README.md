# terraform-azurerm-module-managed-disk
# Requirements
No requirements

# Providers
| Name          | Version       |
| ------------- | ------------- |
| azurerm       | n/a           |


# Modules
No Modules

# Resources
| Name                                            | type               |
| ----------------------------------------------- | ------------------ |
| azurerm_managed_disk.manage_disk                | resource           |
| azurerm_managed_disk.manage_disk_ultra_PV2      | resource           |
| azurerm_virtual_machine_data_disk_attachment.disk_attachment | resource   |
| azurerm_resource_group.rgname | data source |
| azurerm_virtual_machine.virtualmachine | data source |



# Inputs
| Name                 | Description                                  |  type          | Default                                                    |  Required  |
| -------------------- | -------------------------------------------- | -------------- | ---------------------------------------------------------  | ---------- |
| azure_system_name    | The system name, e.g catalog                 | string         | n/a                                                        | yes        |
| environment          | This defines the environment of the resource. two options: dev / prd | string         | n/a                                | yes        |
| name_disk            | This define the name of the disk             | string         | n/a                                                        | yes        |
| os_disk_size_gb      | Specifies the size of the OS disk in gigabytes | string       | null                                                       | yes        |
| disk_attach          | Is it to attach to a Virtual Machine?        | bool           | false                                                      | yes /no |
| vm_name              | Required only when we want to attach the disk to a vm. This defines the name of the VM. Not the full name, the name given when creating de vm *vm_name.     | string     | n/a     | yes / no   |
| avail_zone_id | Index of the Availability Zone which the Virtual Machine should be allocated in. | string | null | no |
| caching | Specifies the caching requirements for this Data Disk. 'None' or 'ReadOnly' or 'ReadWrite' | string | "None" | no |
| creation | This defines the method to use when creating the managed disk. Import/ImportSecure/Empty/Copy/FromImage/Restore/Upload | string | "Empty" | no |
| disk_encryption_secret | Refers to the encryption Secret used for encrypting the data on an Azure managed disk. source_vault_id The ID of the source Key Vault ('Resource ID')/secret_url The URL to the Key Vault Secret ('Secret Identifier') | <pre>object({<br> source_vault_id = string<br> secret_url = string <br> })</pre> | null | no |
| disk_iops_read_only | To set this, the variable 'instance_type' must be set with 'UltraSSD' or 'PremiumV2'. The number of IOPS allowed across all VMs mounting the shared disk as read-only | string | null | no |
| disk_iops_read_write | To set this, the variable 'instance_type' must be set with 'UltraSSD' or 'PremiumV2'.The number of IOPS allowed for this disk | string | null | no |
| disk_mbps_read_only | To set this, the variable 'instance_type' must be set with 'UltraSSD' or 'PremiumV2'.The bandwidth allowed across all VMs mounting the shared disk as read-only | string | null | no |
| disk_mbps_read_write | To set this, the variable 'instance_type' must be set with 'UltraSSD' or 'PremiumV2'.The bandwidth allowed for this disk | string | null | no |
| gallery_image_reference_id | To set this, the variable 'creation' must be set with 'FromImage'.This field cannot be specified if image_reference_id is specified. ID of a Gallery Image Version to copy | string | null | no |
| image_reference_id | To set this, the variable 'creation' must be set with 'FromImage'. This field cannot be specified if gallery_image_reference_id is specified. ID of an existing platform/marketplace disk image to copy | string | null | no |
| key_encryption_key | Refers to the encryption Key used for encrypting the data on an Azure managed disk. source_vault_id The ID of the source Key Vault ('Resource ID') / key_url The URL to the Key Vault Key used as the Key Encryption Key ('key Identifier') | <pre>object({<br> source_vault_id = string<br> key_url = string <br> })</pre>  | null | no |
| logical_sector_size | Logical Sector Size. Possible values are: 512 and 4096. Defaults to 4096 | number | 4096 | no |
| lun | Logic unit number of a data disk attached to a virtual machine | number | 0 | no |
| maximum_shares | The maximum number of VMs that can attach to the disk at the same time. Range (2 - 10) | number | 2 | no |
| source_resource_id | To set this, the variable 'creation' must be set with 'Copy' or 'Restore'.Copy/Restore an existing managed disk or snapshot or Set by Azure Backup or Site Recovery on a restored disk | string | null | no |
| location | This defines the location of the resource | string | "westeurope" | no |
| source_uri | To set this, the variable 'creation' must be set with 'Import' or 'ImportSecure'. Import a VHD file in to the managed disk | string | null | no |
| os_storage_account_type | VM instance type. Standard_LRS / StandardSSD_ZRS / Premium_LRS / PremiumV2_LRS / Premium_ZRS / StandardSSD_LRS / UltraSSD_LRS | string | "StandardSSD_ZRS" | no |
| os_type | Specify a value when the source of an Import, ImportSecure or Copy. 'Windows' / 'Linux' | string | "Linux" | no |
| write_accelerator_enabled | Specifies if Write Accelerator is enabled on the disk. This can only be enabled on Premium_LRS managed disks with no caching and M-Series VMs. | bool | false | no |
| tags                 | Tags to put on resources                     | map(any)       | {}                                                         | no         |
| upload_size_bytes | To set this, the variable 'creation' must be set with 'Upload'.Upload a VHD disk with the help of SAS URL | string | null | no |




# Outputs
| Name                           | Description   |
| ------------------------------ | ------------- |


