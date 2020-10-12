

output "public_ip_address" {
  description = "Public IP address of VM"
  value = data.azurerm_public_ip.ip.ip_address
 
}

output "admin_username" {
  description = "Username needed to log into VM consol"
  value = var.admin_username
}

output "connection_string" {
  description = "Copy/Paste/Enter - You are in the matrix"
  value = "ssh -i ${var.pivate_key} ${var.admin_username}@${data.azurerm_public_ip.ip.ip_address}"
  
}
