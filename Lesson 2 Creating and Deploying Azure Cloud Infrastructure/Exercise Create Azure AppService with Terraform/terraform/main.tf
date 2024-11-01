provider "azurerm" {
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  features {}
}
terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate9553"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
   required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}
locals {
  tags = {
    tier        = "${var.tier}"
    deployment  = "${var.deployment}"
  }
}
module "resource_group" {
  source               = "./modules/resource_group"
  resource_group       = var.resource_group
  location             = var.location
}
# Reference the AppService Module here.
module "appservice" {
  source               = "./modules/appservice"
  resource_group       = "var.resource_group"
  location             = "var.location"
  application_name     = "${var.application_type}-hehe"
  tags = "${var.tags}"
}