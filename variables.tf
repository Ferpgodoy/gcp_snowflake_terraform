variable "environment" {
  type = string
}

variable "unique_id" {
  type = string
}

# GCP

variable "gcp_project_id" {
  type = string
}

# Snowflake

variable "snowflake_org_name" {
  type = string
}

variable "snowflake_account_name" {
  type = string
}

variable "snowflake_private_key" {
  type      = string
  sensitive = true
  default   = null
}

variable "snowflake_private_key_path" {
  type    = string
  default = null
}