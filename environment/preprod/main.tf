module "rg-r" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "vnet" {
  depends_on       = [module.rg-r]
  source           = "../../modules/azurerm_virtual_network"
  virtual_networks = var.virtual_networks
}
module "subnet" {
  depends_on = [module.rg-r, module.vnet]
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
}

module "vm" {
  depends_on       = [module.rg-r, module.subnet]
  source           = "../../modules/azurerm_virtual_machine"
  virtual_machines = var.virtual_machines
  subnet_ids       = module.subnet.subnet_ids
}

