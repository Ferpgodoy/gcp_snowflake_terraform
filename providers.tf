provider "google" {
  project = var.gcp_project_id
}

provider "snowflake" {
  organization_name = var.snowflake_org_name
  account_name      = var.snowflake_account_name
  user              = "TERRAFORM_SVC"
  role              = "SYSADMIN"
  authenticator     = "SNOWFLAKE_JWT"
  private_key       = var.snowflake_private_key != null ? replace(var.snowflake_private_key, "\\n", "\n") : file(var.snowflake_private_key_path)
}