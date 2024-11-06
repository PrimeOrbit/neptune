# PrimeOrbit Azure AD Application Setup

A powershell script to automate the Azure AD application registeration.

## Prerequisites

- **PowerShell**: Ensure you are running the script in PowerShell. Install PowerShell by following the instructions [here](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell).

- **Azure CLI**: Ensure that you have the Azure CLI installed and configured.
  - Install: [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
  
  
- **Azure AD Permissions**: Ensure you have the following **administrative permissions** in Azure AD to run this script:
  1. **Application Administrator** or **Global Administrator** role:
     - Required to create and register Azure AD applications.
     - Needed to assign and grant admin consent for API permissions.
  2. **User Management Administrator** (if applicable):
     - Allows creating Service Principals and adding owners to apps.

- **Important**: Keep your **Tenant ID** and **Redirect URI** ready before running the script. You will be prompted to provide these details during the execution:
  - **Tenant ID**: A valid Azure AD Tenant ID.
  - **Redirect URI**: A valid HTTPS redirect URL for your application (e.g., `https://yoursite.primeorbit.io/redirect`).

## How to Use the Script

1. **Download the Script**: Download the [`aad-app-registration.ps1`](https://prime-orbit-setup.s3.us-east-1.amazonaws.com/azure/aad-app/aad-app-registration.ps1) file to your local machine.
  
2. **Open PowerShell**: Open PowerShell in the directory where the script is saved.

3. **Run the Script**: Execute the following command:

    ```powershell
    ./aad-app-registration.ps1
    ```

4. **Provide Inputs**: During the script execution, you'll be prompted to provide the following inputs:
    - **Azure AD Tenant ID**: You must provide your tenant ID.
    - **Redirect URI**: A valid HTTPS redirect URL for the application (e.g., `https://yoursite.primeorbit.io/redirect`).

5. **Wait for Completion**: The script will register the app, assign permissions, and output the details
 

## Outputs

Once the script completes, the following details are displayed:
- **App Display Name**: The name of the newly created Azure AD app.
- **App ID**: The unique ID of the registered app.
- **Service Principal ID**: The Service Principal ID associated with the app.
- **Password**: The generated client secret for the app.

**Important**: Securely share the **outputs** with PrimeOrbit for integration. 