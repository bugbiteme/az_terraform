variable "client_secret" {
  type = string
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