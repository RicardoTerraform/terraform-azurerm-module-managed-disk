locals {

  tags_default = {
    system         = lower(var.azure_system_name)
    environment    = lower(var.vm_environment)
    infrastructure = "terraform"
    module         = "azurerm-managed-disk"
    module_version = "v1.0"
  }

  disks_tiers = {

    # HDD
    #             S4  S6  S10  S15  S20   S30  S40 	 S50    S60 S70 S80
    "Standard" = [32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32767]
    # SSD           E1 	E2 E3 E4 	E6 	 E10  E15  E20 	 E30 	E40 	E50 	E60 	 E70 	 E80
    "StandardSSD" = [4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32767]
    #           P1 P2  P3  P4  P6 P10   P15  P20  P30 	P40   P50 	P60 	 P70 	  P80
    "Premium" = [4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32767]

  }
}