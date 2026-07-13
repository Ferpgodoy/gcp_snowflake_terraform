# Getting Started with Terraform

This project uses Terraform to provision infrastructure on Google Cloud Platform (GCP).

## Prerequisites

Install the following tools on Windows:

* Git
* Terraform CLI
* Google Cloud SDK (`gcloud`)

---

## 1. Install Terraform

1. Download the latest Windows **AMD64** version from the official website:

https://developer.hashicorp.com/terraform/install

2. Extract the ZIP file.

3. Move `terraform.exe` to a directory included in your `PATH` (for example, `C:\Program Files\Terraform`).

4. Open a new PowerShell window and verify the installation:

```powershell id="n0y8mw"
terraform version
```

---

## 2. Install Google Cloud SDK

Download and install the Google Cloud SDK:

https://cloud.google.com/sdk/docs/install

Verify the installation:

```powershell id="g8l8wj"
gcloud version
```

---

## 3. Authenticate with GCP

Login to your Google account:

```powershell id="4gkt2h"
gcloud auth login
```

Configure Application Default Credentials (ADC):

```powershell id="pmztcu"
gcloud auth application-default login
```

Optionally, set the default project:

```powershell id="4sqc0v"
gcloud config set project <PROJECT_ID>
```

---

## 4. Initialize Terraform

```powershell id="k5uq9q"
terraform init
```

---

## 5. Validate the Configuration

```powershell id="0o4dzf"
terraform validate
```

---

## 6. Format the Code

```powershell id="rk7nse"
terraform fmt -recursive
```

---

## 7. Review the Execution Plan

```powershell id="m4n70m"
terraform plan
```

Or:

```powershell id="y4p2dr"
terraform plan -var-file="env\dev.tfvars"
```

---

## 8. Apply the Changes

```powershell id="3t8xqf"
terraform apply
```

Or:

```powershell id="lckh9s"
terraform apply -var-file="env\dev.tfvars"
```

---

## 9. Destroy Resources

```powershell id="k6l3yu"
terraform destroy
```

---

## Common Commands

```powershell id="e2gf29"
terraform init
terraform validate
terraform fmt -recursive
terraform plan
terraform apply
terraform destroy
terraform output
terraform version
```



how to setup snowflake

USE ROLE ACCOUNTADMIN;

CREATE USER TERRAFORM_SVC
    TYPE = SERVICE
    COMMENT = "Service user for Terraforming Snowflake"
    RSA_PUBLIC_KEY = "<RSA_PUBLIC_KEY_HERE>";

GRANT ROLE SYSADMIN TO USER TERRAFORM_SVC;
GRANT ROLE SECURITYADMIN TO USER TERRAFORM_SVC;

SELECT LOWER(current_organization_name()) as your_org_name, LOWER(current_account_name()) as your_account_name;

terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

provider "snowflake" {
    organization_name = organization_name
    account_name      = account_name
    user              = "TERRAFORM_SVC"
    role              = "SYSADMIN"
    authenticator     = "SNOWFLAKE_JWT"
    private_key       = file(private_key_path)
}

