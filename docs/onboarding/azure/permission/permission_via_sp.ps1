function Validate-GUID {
    param (
        [string]$guidString
    )
    return [guid]::TryParse($guidString, [ref]([guid]::Empty))
}

# Prompt for Tenant ID
$tenantIdValid = $false
while (-not $tenantIdValid) {
    $tenantId = Read-Host -Prompt "Please enter your Azure AD Tenant ID"
    $tenantIdValid = Validate-GUID -guidString $tenantId
    if (-not $tenantIdValid) {
        Write-Host "Invalid Tenant ID format. Please enter a valid one." -ForegroundColor Red
    }
}

# Login to Azure
Write-Host "Logging into Azure..." -ForegroundColor Blue
az login --tenant $tenantId

# Fixed App (Client) ID of the multi-tenant app
$appId = "1f6389ac-130f-43c6-a33d-8d01dcb5fe64"  # Client Id of the Primeorbit App

# Create Service Principal (if not already exists)
Write-Host "Creating the service principal ..." -ForegroundColor Blue
az ad sp create --id $appId

# Read subscriptions from user input
$subscriptions = @()
do {
    $subInput = Read-Host "Enter a Subscription ID (or press Enter to finish)"
    if ($subInput) {
        $subscriptions += $subInput
    }
} while ($subInput)

if ($subscriptions.Count -eq 0) {
    Write-Host "No subscriptions provided. Exiting script." -ForegroundColor Red
    exit
}

# Assign roles to the service principal for each subscription
foreach ($sub in $subscriptions) {
    Write-Host "Assigning roles for subscription $sub ..." -ForegroundColor Cyan
    az role assignment create --assignee $appId --role Reader --scope "/subscriptions/$sub"
    # az role assignment create --assignee $appId --role Contributor --scope "/subscriptions/$sub"
}


Write-Host "Script completed. Assigned roles to the service principal." -ForegroundColor Green
