resource_groups = {
  rg1 = {
    name     = "rg-preprod"
    location = "central india"
  }
}

virtual_networks = {
  vnet1 = {
    name                = "vnet-preprod"
    location            = "central india"
    resource_group_name = "rg-preprod"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "subnet-preprod"
    resource_group_name  = "rg-preprod"
    virtual_network_name = "vnet-preprod"
    address_prefixes     = ["10.0.1.0/24"]
  }

  subnet2 = {
    name                 = "subnet-preprod-2"
    resource_group_name  = "rg-preprod"
    virtual_network_name = "vnet-preprod"
    address_prefixes     = ["10.0.2.0/24"]
  }

  subnet3 = {
    name                 = "subnet-preprod-3"
    resource_group_name  = "rg-preprod"
    virtual_network_name = "vnet-preprod"
    address_prefixes     = ["10.0.3.0/24"]
  }
}

virtual_machines = {
  vm1 = {
    name                = "vm-preprod"
    location            = "central india"
    resource_group_name = "rg-preprod"
    subnet_name         = "subnet-preprod"
    vm_size             = "Standard_B1s"
    computer_name       = "vm-preprod"
    admin_username      = "azureuser"
    admin_password      = "P@ssw0rd1234!"

    image_publisher = "Canonical"
    image_offer     = "UbuntuServer"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }

  vm2 = {
    name                = "vm-preprod-2"
    location            = "central india"
    resource_group_name = "rg-preprod"
    subnet_name         = "subnet-preprod-2"
    vm_size             = "Standard_B1s"
    computer_name       = "vm-preprod-2"
    admin_username      = "azureuser"
    admin_password      = "P@ssw0rd1234!"

    image_publisher = "Canonical"
    image_offer     = "UbuntuServer"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }

  vm3 = {
    name                = "vm-preprod-3"
    location            = "central india"
    resource_group_name = "rg-preprod"
    subnet_name         = "subnet-preprod-3"
    vm_size             = "Standard_B1s"
    computer_name       = "vm-preprod-3"
    admin_username      = "azureuser"
    admin_password      = "P@ssw0rd1234!"

    image_publisher = "Canonical"
    image_offer     = "UbuntuServer"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
}