

output "public_ip_address" {
  value = "${azurerm_public_ip.myterraformpublicip.ip_address}"
}

output "admin_username" {
  value = "${var.admin_username}"
}

output "connection_string" {
  description = "Copy/Paste/Enter - You are in the matrix"
  value = "ssh -i ${var.pivate_key} ${var.admin_username}@${azurerm_public_ip.myterraformpublicip.ip_address}"
}