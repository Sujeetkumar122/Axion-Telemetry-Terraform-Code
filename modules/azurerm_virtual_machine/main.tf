resource "azurerm_network_interface" "nic" {
  for_each            = { for k, v in var.virtual_machines : k => v if lookup(v, "network_interface_id", null) == null }
  name                = lookup(each.value, "nic_name", "${each.value.name}-nic")
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = lookup(var.subnet_ids, lookup(each.value, "subnet_name", lookup(each.value, "subnet_key", "")), null)
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "vm" {
  for_each = var.virtual_machines

  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = lookup(each.value, "network_interface_id", null) != null ? [each.value.network_interface_id] : [azurerm_network_interface.nic[each.key].id]
  vm_size               = each.value.vm_size

  storage_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }

  storage_os_disk {
    name              = "${each.value.name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = each.value.computer_name
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

 