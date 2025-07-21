A powershell script to automate the service principal creation and adding
permission to service principal.

## Prerequisites

- **PowerShell**: Ensure you are running the script in PowerShell. Install
  PowerShell by following the instructions
  [here](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell).

- **Azure CLI**: Ensure that you have the Azure CLI installed and configured.

  - Install:
    [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

  ## How to Use the Script

1. **Download the Script**: Download the
   [`permission_via_sp.ps1`](https://prime-orbit-setup.s3.us-east-1.amazonaws.com/azure/permission/permission_via_sp.ps1)
   file to your local machine.

2. **Open PowerShell**: Open PowerShell in the directory where the script is
   saved.

3. **Run the Script**: Execute the following command:

   ```powershell
   ./permission_via_sp.ps1
   ```

4. **Provide Inputs**: During the script execution, you'll be prompted to
   provide the following inputs:

   - **Azure AD Tenant ID**: You must provide your tenant ID.

5. The script will assign reader permissions to subscription level
