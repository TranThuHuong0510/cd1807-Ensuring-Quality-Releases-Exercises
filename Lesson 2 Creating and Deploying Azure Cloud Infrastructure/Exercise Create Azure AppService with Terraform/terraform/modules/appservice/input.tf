# Resource Group/Location
variable "location" {}
variable "resource_group" {}
variable "application_name" {}

# Tags
variable "tags" {
  type = map(string)
}
