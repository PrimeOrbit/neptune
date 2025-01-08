locals {
    today = timestamp()
    active_days = 8760 * 2
}

resource "azuread_application" "ad_app_registration" {
  display_name = "PrimeOrbit-App-V2.1"

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"  # Microsoft Graph API App ID

    # Define the API permissions
    # resource_access {
    #  id   = "b340eb25-3456-403f-be2f-af7a0d370277"  # User.ReadBasic.All
    #  type = "Scope"
    # }

    resource_access {
      id   = "df021288-bdef-4463-88db-98f22de89214"  # User.Read.All
      type = "Role"
    }

    resource_access {
      id   = "a267235f-af13-44dc-8385-c1dc93023186"  # TeamsActivity.Send
      type = "Role"
    }

  }

  single_page_application {
    redirect_uris = [
      "${var.redirect_uri}"
    ]
  }    

  web {
    implicit_grant {
      access_token_issuance_enabled = true
      id_token_issuance_enabled = true
    }
  
  }

}

resource "azuread_service_principal" "ad_service_principle" {
  application_id = azuread_application.ad_app_registration.application_id
}

resource "azuread_application_password" "password" {
  application_object_id = azuread_application.ad_app_registration.object_id
  start_date            = local.today
  end_date              = timeadd(local.today, "${local.active_days}h")
  # formatdate("YYYY-MM-ddTHH:mm:ssZ", add(local.today, "30d")) 
}

# Use local-exec provisioner to update Azure AD app ownership
resource "null_resource" "update_app_owner" {
  provisioner "local-exec" {
    command = <<EOT
      az ad app owner add --id ${azuread_application.ad_app_registration.application_id} --owner-object-id $(az ad signed-in-user show --query id -o tsv)
    EOT
  }
  depends_on = [azuread_application.ad_app_registration]
}

# Use local-exec provisioner to grant admin consent 
resource "null_resource" "grant_admin_consent" {
  provisioner "local-exec" {
    command = <<EOT
      az ad app permission admin-consent --id ${azuread_application.ad_app_registration.application_id}
    EOT
  }
  depends_on = [null_resource.update_app_owner] # Make sure app ownership is updated before granting consent
}