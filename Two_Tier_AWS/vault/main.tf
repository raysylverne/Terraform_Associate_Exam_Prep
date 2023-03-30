/* Thie example is for Lab use case ONLY. Root tokens should NEVER be used on a day-to-day basis, 
nor should you use a root token for Terraform access. Better to use a different auth method, such as 
AppRole, which is a better solution to establish connectivity between Terraform and Vault.*/
provider "vault" {
  address = "http://127.0.0.1:8200"
  token   = "hvs.2ImxzYbxw0EsAamvEeZuEFKi"
}


# This data block will use the Vault provider and token to retrieve the sensitive values we need:
data "vault_generic_secret" "phone_number" {
  path = "secret/app"
}

# This output block  uses the data retrieved from Vault
output "phone_number" {
value = data.vault_generic_secret.phone_number.data["phone_number"]
sensitive = true
}

