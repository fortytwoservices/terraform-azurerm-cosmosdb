variable "name" {
  type        = string
  description = "The name used for deploying resources."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group where the resources will be deployed."
}

variable "location" {
  type        = string
  description = "The location where the resources will be deployed."
}

variable "offer_type" {
  type        = string
  description = <<EOF
  (Optional) The offer type for the CosmosDB database. Defaults to 'Standard'.
  
  Currently, this can only be set to 'Standard'.
  EOF
  default     = "Standard"
}

variable "kind" {
  type        = string
  description = <<EOF
  (Optional) The type of account to create. Defaults to 'GlobalDocumentDB'.
  
  Valid options are 'GlobalDocumentDB', 'MongoDB' and 'Parse'.
  EOF
  default     = null
}

variable "consistency_policy" {
  type = object({
    consistency_level       = string
    max_interval_in_seconds = number
    max_staleness_prefix    = number
  })
  description = "The consistency policy for the CosmosDB account."
}

variable "geo_location" {
  type = object({
    location          = string
    failover_priority = number
    zone_redundant    = optional(bool)
  })
  description = "The geo location for the CosmosDB account."
}

variable "tags" {
  type        = map(string)
  description = <<EOF
  (Optional) A mapping of tags to assign to the resource.

  Any resources created with this module will also have these tags:
  - source: terraform
  - module: amestofortytwo/cosmosdb/azurerm
  - module_version: `<version>`
  EOF
  default     = {}
}
