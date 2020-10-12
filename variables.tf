variable "client_secret" {
  description = "client_secret used in azure provider"
  type        = string
}

variable "subscription_id" {
  description = "subscription_id used in azure provider"
  type        = string
}

variable "client_id" {
  description = "client_id used in azure provider"
  type        = string
}

variable "tenant_id" {
  description = "tenant_id used in azure provider"
  type        = string
}

variable "region" {
  type    = string
  default = "westus2"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}
variable "namespace" {
  type    = string
  default = "Terraform Demo"
}

variable "public_key" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "pivate_key" {
  type    = string
  default = "~/.ssh/id_rsa"
}