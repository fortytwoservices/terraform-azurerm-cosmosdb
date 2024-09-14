<!-- BEGIN_TF_DOCS -->
# CosmosDB

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.44.1)

## Examples

### Basic example

```hcl

```

### Advanced Example

```hcl

```

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>= 3.44.1)

## Resources

The following resources are used by this module:

- [azurerm_cosmosdb_account.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) (resource)
- [azurerm_cosmosdb_sql_database.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_database) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_consistency_policy"></a> [consistency\_policy](#input\_consistency\_policy)

Description: The consistency policy for the CosmosDB account.

Type:

```hcl
object({
    consistency_level       = string
    max_interval_in_seconds = number
    max_staleness_prefix    = number
  })
```

### <a name="input_geo_location"></a> [geo\_location](#input\_geo\_location)

Description: The geo location for the CosmosDB account.

Type:

```hcl
object({
    location          = string
    failover_priority = number
    zone_redundant    = optional(bool)
  })
```

### <a name="input_location"></a> [location](#input\_location)

Description: The location where the resources will be deployed.

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: The name used for deploying resources.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: Resource group where the resources will be deployed.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_kind"></a> [kind](#input\_kind)

Description:   (Optional) The type of account to create. Defaults to 'GlobalDocumentDB'.  

  Valid options are 'GlobalDocumentDB', 'MongoDB' and 'Parse'.

Type: `string`

Default: `null`

### <a name="input_offer_type"></a> [offer\_type](#input\_offer\_type)

Description:   (Optional) The offer type for the CosmosDB database. Defaults to 'Standard'.  

  Currently, this can only be set to 'Standard'.

Type: `string`

Default: `"Standard"`

### <a name="input_sql_database"></a> [sql\_database](#input\_sql\_database)

Description: The SQL database used with the CosmosDB account.

Type:

```hcl
object({
    throughput = optional(number)
    autoscale_settings = optional(object({
      max_throughput = number
    }))
  })
```

Default:

```json
{
  "throughput": 400
}
```

### <a name="input_tags"></a> [tags](#input\_tags)

Description:   (Optional) A mapping of tags to assign to the resource.

  Any resources created with this module will also have these tags: 'source: terraform', 'module: fortytwoservices/cosmosdb/azurerm', 'module\_version: `<version>`'.

Type: `map(string)`

Default: `{}`

## Outputs

No outputs.

## Modules

No modules.

<!-- END_TF_DOCS -->