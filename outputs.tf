

output "public_ip_address" {
  description = "Public IP address of VM"
  value = "${azurerm_public_ip.myterraformpublicip.ip_address}"
 
}

output "admin_username" {
  description = "Username needed to log into VM consol"
  value = "${var.admin_username}"
}

output "connection_string" {
  description = "Copy/Paste/Enter - You are in the matrix"
  value = "ssh -i ${var.pivate_key} ${var.admin_username}@${azurerm_public_ip.myterraformpublicip.ip_address}"
  
}