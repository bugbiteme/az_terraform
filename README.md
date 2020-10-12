# az_terraform
Terraform to provision a VM in Azure

Authenticates to Azure using either a Service Principal or Managed Service Identity.

Instructions for setting up authentication:

```
https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html
```

If you have multiple Azure subscriptions, first query your account with az account list to get a list of subscription ID and tenant ID values:

Azure CLI

`az account list --query "[].{name:name, subscriptionId:id, tenantId:tenantId}"`

To use a selected subscription, set the subscription for this session with az account set. Set the SUBSCRIPTION_ID environment variable to hold the value of the returned id field from the subscription you want to use:

Azure CLI

`az account set --subscription="${SUBSCRIPTION_ID}"`

Now you can create a service principal for use with Terraform. Use az ad sp create-for-rbac, and set the scope to your subscription as follows:

Azure CLI

`az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/${SUBSCRIPTION_ID}"`

Your appId, password, sp_name, and tenant are returned. Make a note of the appId and password.

```
ARM_SUBSCRIPTION_ID
ARM_CLIENT_ID
ARM_CLIENT_SECRET
ARM_TENANT_ID
ARM_ENVIRONMENT
```

before running 

`terraform apply`

please generate the ssh key (default "id_rsa.pub")

*Note: you can generate the key with any name you want, but you need to update the variable with the new filename/location

Once the VM has been created by terraform, you can get the public IP adress by running the following command:

`az vm show --resource-group myResourceGroup --name myVM -d --query [publicIps] --o tsv`

Then connect to VM using the ssh key:

`ssh -i "~/.ssh/id_rsa" azureuser@<IP address>`

(source: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure)

Notes: Outputs for public IP address may be blank once `terraform apply` completes. You can then run the command 
`terraform refresh` to obtain these values.

If anyone reading this has a workaround, please let me know (beer or lunch will be on me!)

To show configuration:
`terraform show`

List resources in the state
`terraform state list`

To visualize dependencies:
`terraform graph | dot -Tsvg > graph.svg`
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12 |
| archive | ~> 1.2 |
| azurerm | ~> 1.44 |
| random | ~> 2.2 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 1.44 |
| random | ~> 2.2 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_username | n/a | `string` | `"azureuser"` | no |
| client\_id | client\_id used in azure provider | `string` | n/a | yes |
| client\_secret | client\_secret used in azure provider | `string` | n/a | yes |
| namespace | n/a | `string` | `"Terraform Demo"` | no |
| pivate\_key | n/a | `string` | `"~/.ssh/id_rsa"` | no |
| public\_key | n/a | `string` | `"~/.ssh/id_rsa.pub"` | no |
| region | n/a | `string` | `"westus2"` | no |
| subscription\_id | subscription\_id used in azure provider | `string` | n/a | yes |
| tenant\_id | tenant\_id used in azure provider | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| admin\_username | Username needed to log into VM consol |
| connection\_string | Copy/Paste/Enter - You are in the matrix |
| public\_ip\_address | Public IP address of VM |

