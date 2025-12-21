terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.44.1"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dev" {
  name     = "rg-demo-dev"
  location = "westeurope"
}

module "cosmosdb" {
  source  = "fortytwoservices/cosmosdb/azurerm"
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

  sql_database = {
    throughput = 400

    # Optional, if you want to enable autoscale.
    # If set, you can't define the `throughput` attribute.
    # autoscale_settings = {
    #   max_throughput = 1000
    # }
  }
}
