resource "azurerm_resource_group" "dev" {
  name     = "rg-demo-dev"
  location = "westeurope"
}

module "cosmosdb" {
  source  = "amestofortytwo/cosmosdb/azurerm"
  version = "0.1.0"

  name                = "demo-dev"
  resource_group_name = azurerm_resource_group.dev.name
  location            = azurerm_resource_group.dev.location

  consistency_policy = {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 10000
  }

  geo_location = {
    failover_priority = 0
    location          = "northeurope"
  }
}
