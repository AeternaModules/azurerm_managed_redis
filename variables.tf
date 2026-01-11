variable "managed_rediss" {
  description = <<EOT
Map of managed_rediss, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
Optional:
    - high_availability_enabled
    - public_network_access
    - tags
    - customer_managed_key (block):
        - key_vault_key_id (required)
        - user_assigned_identity_id (required)
    - default_database (block):
        - access_keys_authentication_enabled (optional)
        - client_protocol (optional)
        - clustering_policy (optional)
        - eviction_policy (optional)
        - geo_replication_group_name (optional)
        - module (optional, block):
            - args (optional)
            - name (required)
        - persistence_append_only_file_backup_frequency (optional)
        - persistence_redis_database_backup_frequency (optional)
    - identity (block):
        - identity_ids (optional)
        - type (required)
EOT

  type = map(object({
    location                  = string
    name                      = string
    resource_group_name       = string
    sku_name                  = string
    high_availability_enabled = optional(bool, true)
    public_network_access     = optional(string, "Enabled")
    tags                      = optional(map(string))
    customer_managed_key = optional(object({
      key_vault_key_id          = string
      user_assigned_identity_id = string
    }))
    default_database = optional(object({
      access_keys_authentication_enabled = optional(bool, false)
      client_protocol                    = optional(string, "Encrypted")
      clustering_policy                  = optional(string, "OSSCluster")
      eviction_policy                    = optional(string, "VolatileLRU")
      geo_replication_group_name         = optional(string)
      module = optional(list(object({
        args = optional(string)
        name = string
      })))
      persistence_append_only_file_backup_frequency = optional(string)
      persistence_redis_database_backup_frequency   = optional(string)
    }))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.managed_rediss : (
        v.default_database.module == null || (length(v.default_database.module) <= 4)
      )
    ])
    error_message = "Each module list must contain at most 4 items"
  }
}

