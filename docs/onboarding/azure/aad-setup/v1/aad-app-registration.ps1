# Variables
$displayName = "PrimeOrbit-App-V2.1"
$startDate = (Get-Date).ToString("yyyy-MM-dd")
$endDate = (Get-Date).AddYears(2).ToString("yyyy-MM-dd") # Validity (2 years)
$graphResourceId = "00000003-0000-0000-c000-000000000000" # Graph API App ID
$userReadAll = "df021288-bdef-4463-88db-98f22de89214" # User.Read.All permission
$teamsActivitySend = "a267235f-af13-44dc-8385-c1dc93023186" # TeamsActivity.Send permission

# Welcome banner
Write-Host "-------------------------------------" -ForegroundColor DarkGreen -BackgroundColor Yellow
Write-Host "  WELCOME TO PRIMEORBIT AZURE SETUP  " -ForegroundColor Blue -BackgroundColor Yellow
Write-Host "-------------------------------------" -ForegroundColor DarkGreen -BackgroundColor Yellow

# validate GUID
function Validate-GUID {
    param (
        [string]$guidString
    )
    
    if ($guidString -match "^[{]?[0-9a-fA-F]{8}[-]?[0-9a-fA-F]{4}[-]?[0-9a-fA-F]{4}[-]?[0-9a-fA-F]{4}[-]?[0-9a-fA-F]{12}[}]?$") {
        return $true
    } else {
        return $false
    }
}

# Tenant ID and validation
$tenantIdValid = $false
while (-not $tenantIdValid) {
    $tenantId = Read-Host -Prompt "Please enter your Azure AD Tenant ID"
    $tenantIdValid = Validate-GUID -guidString $tenantId
    if (-not $tenantIdValid) {
        Write-Host "Invalid Tenant ID format. Please enter a valid one." -ForegroundColor Red
    }
}

# Redirect URI and validation
$redirectUriValid = $false
while (-not $redirectUriValid) {
    $redirectUri = Read-Host -Prompt "Please enter the Redirect URI (e.g., 'https://yoursite.primeorbit.io/login')"
    
    # HTTPS check
    try {
        [System.Uri]$uriObject = $redirectUri
        if ($uriObject.IsAbsoluteUri -and $uriObject.Scheme -eq "https") {
            $redirectUriValid = $true
        } else {
            Write-Host "Invalid URI format or not using HTTPS. Please enter a valid absolute HTTPS URI." -ForegroundColor Red
        }
    } catch {
        Write-Host "Invalid URI format. Please enter a valid absolute HTTPS URI." -ForegroundColor Red
    }
}

# Login
Write-Host "Logging into Azure..." -ForegroundColor Blue
az login --tenant $tenantId

# App registration
Write-Host "Creating Azure AD Application..." -ForegroundColor Blue
$appId = az ad app create --display-name $displayName --web-redirect-uris $redirectUri --sign-in-audience AzureADMultipleOrgs --enable-id-token-issuance true --enable-access-token-issuance true --query appId -o tsv
$id = az ad app show --id $appId --query id -o tsv
az rest --method PATCH --uri "https://graph.microsoft.com/v1.0/applications/$id" --headers 'Content-Type=application/json' --body "{'displayName': '$displayName', 'spa': {'redirectUris': ['$redirectUri']}}"

# SP creation
Write-Host "Creating Service Principal..." -ForegroundColor Blue
$spId = az ad sp create --id $appId --query id -o tsv

# Obtain ownership 
Write-Host "Adding current user as app owner..." -ForegroundColor Blue
$ownerId = az ad signed-in-user show --query id -o tsv
az ad app owner add --id $appId --owner-object-id $ownerId

# API permissions
Write-Host "Adding API permissions..." -ForegroundColor Blue
az ad app permission add --id $appId --api $graphResourceId --api-permissions $userReadAll=Role
az ad app permission add --id $appId --api $graphResourceId --api-permissions $teamsActivitySend=Role
az ad app permission grant --id $appId --api $graphResourceId --scope "User.Read.All"
az ad app permission grant --id $appId --api $graphResourceId --scope "TeamsActivity.Send"

# Admin consent grant
Write-Host "Granting admin consent..." -ForegroundColor Blue
Start-Sleep -Seconds 5
az ad app permission admin-consent --id $appId

# Creds
Write-Host "Generating app credential..." -ForegroundColor Blue
$password = az ad app credential reset --id $appId --append --end-date $endDate --query password -o tsv

# Outputs
Write-Host "   ---------------- OUTPUTS ----------------   " -BackgroundColor DarkBlue
Write-Host "App Display Name: " -NoNewline
Write-Host "$displayName" -ForegroundColor DarkGreen
Write-Host "App ID: " -NoNewline
Write-Host "$appId" -ForegroundColor DarkGreen
Write-Host "Service Principal ID: " -NoNewline
Write-Host "$spId" -ForegroundColor DarkGreen
Write-Host "Password: " -NoNewline
Write-Host "$password" -ForegroundColor DarkGreen
Write-Host "Redirect URI: " -NoNewline
Write-Host "$redirectUri" -ForegroundColor DarkGreen

