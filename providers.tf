terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 0.4.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "azuredevops" {
  org_service_url       = var.azure_devops_org
  personal_access_token = var.azure_devops_pat
}