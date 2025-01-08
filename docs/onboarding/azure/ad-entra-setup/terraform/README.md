### IMP: Outdated Doc
 
## Azure - Generate Client-ID and Client-Secret
PrimeOrbit's Cost Management Solution provides user authentication and authorization to their WebApp using AzureAD. It also requires Azure Subscription(s) access to query Cost and Usage report and get configuration data of other Azure resources. To achieve this, we need to perform the following tasks:

### Prerequisits:

Before you begin, ensure that you have the following prerequisites set up:

* [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/): Install Azure CLI by following the official installation instructions. 
* [Terraform](https://developer.hashicorp.com/terraform/downloads): Download and install Terraform from the official website.
* **Azure Subscription ID**: Make sure you have an Azure Subscription ID with Active Directory App registration permission available.
* Administrator must have completed the customervm-setup and domainmapping-setup steps.
* Keep the domain mapping handy. For example, if the domain mapping is `costapp.example.com`, then the AD redirection URI will be `https://costapp.example.com/`

### Run the Terraform script

To generate the client ID and client secret, follow these steps:

The following actions must be done from a machine that has cloned the git repository. These commands will not work in isolation.

1.  Clone the Mercury-Customer-Setup repository from GitHub.
2.  Navigate to the admin-tasks/azureaad-setup directory.
3.  Login to Azure using Azure CLI by running the following command in your command-line interface:

    Run the Azure login command:

    ```shell
    az login
    ```

    If you have multiple tenants, you can specify the tenant domain using the following command:

    ```shell 
    az login --tenant <tenant-domain>
    ``` 

4. Initialize Terraform in the project directory by running the following command:

    Make sure you are the correct directory:
    ```shell
    cd azureaad-setup
    ```
    Initialize Terraform:
    ```shell 
    terraform init
    ```
5. Run the Terraform script to generate the client ID and client secret.

    ```shell 
    terraform apply
    ```  

    When prompts: 
    * Please enter the AD redirection URI (Eg: https://costapp.example.com/)
    * Please enter Your-Subscription-ID
    * Please enter 'Yes' on asking a confirmation post review the report it shows

    ```Make sure to copy the generated outputs displayed in the command-line interface. ``` <br />

By following these steps, you'll be able to generate the required client ID and client secret using Terraform and Azure CLI.

**Note**: Ensure that you securely store and handle the generated client ID and client secret. Follow security best practices to protect this sensitive information.

---------

### Proceed with Care: Optional and Conditional Steps

#### Retrieve Outputs
* If you need to retrieve the outputs at a later time, even after closing the terminal, you can use the following command (From the same directory):
    ```shell
    terraform output
    ```
#### Delete Generated Resources
* To delete the generated IDs, secrets, and other resources, run the following command:
    ```shell 
    terraform destroy
    ```

    When prompts: 
    * Please enter the AD redirection URI (Eg: https://costapp.example.com/)
    * Please enter Your-Subscription-ID
    * Please enter 'Yes' on asking a confirmation post review the report it shows


---------

If you have any questions or need further assistance, please don't hesitate to reach out.

Thank you!