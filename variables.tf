variable "name_disk" {
  type        = string
  description = "This define the name of the disk"
}

variable "azure_system_name" {
  type        = string
  description = "This defines the system of the resource"
}

variable "environment" {
  type        = string
  description = "This defines the environment of the resource. two options: dev | prd"
}

variable "os_disk_size_gb" {
  type        = string
  description = "Specifies the size of the OS disk in gigabytes"
  default     = null
}

variable "vm_name" {
  type    = string
  default = "Required only when we want to attach the disk to a vm. This defines the name of the VM. Not the full name, only the name given when creating a vm *vm_name."
}

variable "creation" {
  type        = string
  description = "This defines the method to use when creating the managed disk. Import|ImportSecure|Empty|Copy|FromImage|Restore|Upload"
  default     = "Empty"
}

variable "location" {
  type        = string
  description = "This defines the location of the resource"
  default     = "westeurope"
}

variable "tags" {
  type        = map(any)
  description = "Tags to put on resources"
  default     = {}
}

variable "os_storage_account_type" {
  type        = string
  description = "VM instance type. Standard_LRS | StandardSSD_ZRS | Premium_LRS | PremiumV2_LRS | Premium_ZRS | StandardSSD_LRS | UltraSSD_LRS"
  default     = "StandardSSD_ZRS"
}

variable "source_uri" {
  type        = string
  description = "To set this, the variable 'creation' must be set with 'Import' or 'ImportSecure'. Import a VHD file in to the managed disk"
  default     = null
}

variable "source_resource_id" {
  type        = string
  description = "To set this, the variable 'creation' must be set with 'Copy' or 'Restore'.Copy/Restore an existing managed disk or snapshot or Set by Azure Backup or Site Recovery on a restored disk"
  default     = null
}

variable "image_reference_id" {
  type        = string
  description = "To set this, the variable 'creation' must be set with 'FromImage'. This field cannot be specified if gallery_image_reference_id is specified. ID of an existing platform/marketplace disk image to copy"
  default     = null
}

variable "gallery_image_reference_id" {
  type        = string
  description = "To set this, the variable 'creation' must be set with 'FromImage'.This field cannot be specified if image_reference_id is specified. ID of a Gallery Image Version to copy"
  default     = null
}

variable "upload_size_bytes" {
  type        = string
  description = "To set this, the variable 'creation' must be set with 'Upload'.Upload a VHD disk with the help of SAS URL"
  default     = null
}

variable "disk_iops_read_write" {
  type        = string
  description = "To set this, the variable 'instance_type' must be set with 'UltraSSD' or 'PremiumV2'.The number of IOPS allowed for this disk"
  default     = null
}

variable "disk_mbps_read_write" {
  type        = string
  description = "To set this, the variable 'instance_type' must be set with 'UltraSSD' or 'PremiumV2'.The bandwidth allowed for this disk"
  default     = null
}

variable "disk_iops_read_only" {
  type        = string
  description = "To set this, the variable 'instance_type' must be set with 'UltraSSD' or 'PremiumV2'. The number of IOPS allowed across all VMs mounting the shared disk as read-only"
  default     = null
}

variable "disk_mbps_read_only" {
  type        = string
  description = "To set this, the variable 'instance_type' must be set with 'UltraSSD' or 'PremiumV2'.The bandwidth allowed across all VMs mounting the shared disk as read-only"
  default     = null
}

variable "os_type" {
  type        = string
  description = "Specify a value when the source of an Import, ImportSecure or Copy. 'Windows' | 'Linux'"
  default     = "Linux"
}

variable "maximum_shares" {
  type        = number
  description = "The maximum number of VMs that can attach to the disk at the same time. Range (2 - 10)"
  default     = 2
}

variable "avail_zone_id" {
  type        = string
  description = "Index of the Availability Zone which the Virtual Machine should be allocated in."
  default     = null
}

variable "logical_sector_size" {
  type        = number
  description = "Logical Sector Size. Possible values are: 512 and 4096. Defaults to 4096"
  default     = 4096
}

variable "disk_encryption_secret" {
  type = object({
    source_vault_id = string
    secret_url      = string
  })
  description = "Refers to the encryption Secret used for encrypting the data on an Azure managed disk. source_vault_id The ID of the source Key Vault ('Resource ID')/secret_url The URL to the Key Vault Secret ('Secret Identifier')"
  default     = null
}

variable "key_encryption_key" {
  type = object({
    source_vault_id = string
    key_url         = string
  })
  description = "Refers to the encryption Key used for encrypting the data on an Azure managed disk. source_vault_id The ID of the source Key Vault ('Resource ID') / key_url The URL to the Key Vault Key used as the Key Encryption Key ('key Identifier')"
  default     = null
}

variable "disk_attach" {
  type        = bool
  description = "Is it to attach to a Virtual Machine?"
  default     = false
}

variable "lun" {
  type        = number
  description = "Logic unit number of a data disk attached to a virtual machine"
  default     = 0
}

variable "caching" {
  type        = string
  description = "Specifies the caching requirements for this Data Disk. 'None' or 'ReadOnly' or 'ReadWrite'"
  default     = "None"
}

variable "write_accelerator_enabled" {
  type        = bool
  description = "Specifies if Write Accelerator is enabled on the disk. This can only be enabled on Premium_LRS managed disks with no caching and M-Series VMs."
  default     = false
}
