# az_terraform
Terraform to provision a VM in Azure

Prereq: Install azure and have it linked to your account

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

*Note: you can generate the key with any name you want, but you need to update that in the .tf file

once VM has been created by terraform, you can get the public IP adress by running the following command:

`az vm show --resource-group myResourceGroup --name myVM -d --query [publicIps] --o tsv`

Then connect to VM using the ssh key:

`ssh -i "~/.ssh/id_rsa" azureuser@<IP address>`

(source: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure)
