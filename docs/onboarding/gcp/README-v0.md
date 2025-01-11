# PrimeOrbit GCP Setup Documentation

Welcome to the PrimeOrbit GCP Setup guide! Here you can find all the necessary resources to connect PrimeOrbit with your GCP environments. Follow the relevant guide based on your GCP environment.

## Before you begin
1. Review [Required permissions](https://cloud.google.com/iam/docs/understanding-custom-roles#required_permissions_and_roles) and roles to create an IAM role at the organization level
2. Ensure that you have the following permissions to enable and configure the export of Google Cloud billing data to a BigQuery dataset:

    1. <b>Billing Account Administrator</b> role for the target Cloud Billing account
    2. [BigQuery User role for the Cloud project](https://cloud.google.com/bigquery/docs/dataset-access-controls) that contains the BigQuery dataset that will be used to store the Cloud Billing data
    3. You need a user with Project IAM Admin role to add the service account ID as a member in your GCP project.
    4. If your organization uses a domain restriction constraint, you will have to update the policy to allow the service account that will be created below. 


## Setup GCP Service Account and Permissions
Please follow the [instructions](https://cloud.google.com/billing/docs/how-to/export-data-bigquery-setup) from Google to get it done.

Here is the summary of the steps:
1. Create a Service Account with the required roles assigned.
1. Create a project where the Cloud Billing data will be stored, and enable billing on the project (if you haven't already done so).
2. Configure permissions on the project and on the Cloud Billing account.
3. Enable the BigQuery Data Transfer Service API (required to export your pricing data).
4. Create a BigQuery dataset to store the data in.
5. Enable Cloud Billing export of cost data and pricing data to be written into the dataset.


### Create the Service Account with roles assigned
1. Log into the GCP console.

2. Search for <b>Service Accounts</b>, and click <b>Create New</b>.<br>
-![alt text](./images/image-13.png)

3. Enter the Service Account details:
    - Service Account Name: `primeorbitserviceaccount`
    - Service Account ID: `primeorbitserviceaccount`
    - Description: `primeorbitserviceaccount Access`
    - ![alt text](./images/image-15.png)
    
3. Configure these roles:
    - <b>Billing Account Usage Commitment Recommender viewer</b>
    - <b>roles/viewer</b>
    - <b>roles/recommender.viewer</b>
    - <b>roles/monitoring.viewer</b>
    - <b>roles/logging.viewer</b>
    <br>![alt text](./images/image-30.png)
2. Click Done

### Purpose of the Roles and Permissions
The service account should have the following roles:
- Billing Account Usage Commitment Recommender viewer - To view the billing data for 'Cost Insights and Recommendations'
- roles/viewer - To view the cloud resources, metadata, and policy information for 'Virtual Tags and Recommendations'
- roles/recommender.viewer - To ingest the recommendations for 'Cost Recommendations'
- roles/monitoring.viewer - To view utilization metrics for Compute/Databases/etc., for building 'Recommendations and Insights'
- roles/logging.viewer - To view ONLY system logs for 'Recommendations'
#### Only needed for the BigQuery dataset
- BigQuery Data Viewer - To view the data in BigQuery for 'Cost Insights and Recommendations'
- BigQuery Job User - To run queries in BigQuery for 'Cost Insights and Recommendations'
- BigQuery Read Session User - To read data from BigQuery for 'Cost Insights and Recommendations'
- BigQuery Data Transfer Service Agent - To transfer data from BigQuery for 'Cost Insights and Recommendations'

### Create a Service Account Key
1. Click on the three dots next to the service account and choose Manage Keys
![alt text](./images/image-17.png)
4. Click `ADD KEY` --> `Create new key` and choose JSON <br>
    - Click `CREATE` and save the JSON file. You will need to share this file with PrimeOrbit.
    <br>![alt text](./images/image-18.png)

### Create Detailed Usage Cost Dataset
The first step is to configure your Cloud Billing Data Exports in the Google Cloud console. You may already have completed these steps for other purposes, but please confirm the steps here match what you have previously set up.

**Google recommends creating a dedicated project for billing data.

1. select <b>Launch GCP console</b>
2. In the Google Cloud account, select <b>Billing --> Billing Export</b>.<br>
![alt text](./images/image-25.png)
3. Click on <b>Edit settings</b> under Detailed usage cost <br>
![alt text](./images/image-20.png)
3. Select the right Project and Dataset.<br>
![alt text](./images/image-28.png)
3. Create a new dataset if there isn't one already.
    - Enter a `Dataset ID` as `all_billing_dataset`.
    - Select a `Data location`.
    - Set the `Default table expiration` to <b>Never</b>.
    - Set the `Encryption option` to <b>Google-managed key</b>.
    * Make sure you select the right project.<br>
    ![alt text](./images/image-29.png)
8. Click `Create Dataset`.
9. Select the dataset that was just created. 
9. Then, click `Save`
<br>![alt text](./images/image-27.png)

    ```
    Note: Enabling Detailed usage cost is a one-time action for the entire billing account. This setting applies to all projects under the billing account, so there is no need to enable it individually for each project.
    ```

### Create Pricing Dataset
In the same console as above, you can create a new dataset for pricing data. This dataset will be used to store the pricing data for the resources in your GCP environment.

1. select <b>Launch GCP console</b>
2. In the Google Cloud account, select <b>Billing --> Billing Export</b>.<br>
3. Click on <b>Edit settings</b> under Pricing <br>
4. You might see a notification to enable BigQuery Data Transfer Service API. Click on the link to enable the API.
![alt text](./images/image-26.png)
3. Select the right Project, Dataset, and the Service Account.<br>
![alt text](./images/image-32.png)
8. Click `Save`


### Create the BiqQuery Datasets
Before you enable your Cloud Billing data to export to BigQuery, you must create at least one BigQuery dataset to manage your exported data. You can use the same dataset to contain your detailed usage cost data and your pricing data.

1. Sign in to the Google Cloud console and go to the [BigQuery](https://console.cloud.google.com/bigquery) page.
2. Scroll down to your project <br> 
![alt text](./images/image-33.png)
3. Copy the table name where the billing export is available. In your BigQuery dataset, the table is named `gcp_billing_export_v1_*`.
4. Once the table is accessible, make note of its fully qualified name for use in later steps. This name consists of is the Project ID, Dataset and Table name of the table you configured.
    - For example: `po-billing-only.all_billing_dataset.gcp_billing_export_resource_v1_0127F7_2F14CC_1C4E4E`
    - In that example:
        - Project ID: `po-billing-only`
        - Dataset: `all_billing_dataset`
        - Table name: `gcp_billing_export_resource_v1_0127F7_2F14CC_1C4E4E`
        - Tip: The fully qualified table name will always include the word resource. If this is missing, please reconfirm your export type is Detailed usage cost data.
4. Select the table and click `+ Share` <br>
![alt text](./images/image-7.png)
5. Click `+ Add Principal`<br>
![alt text](./images/image-8.png)
6. Add the service account and role, then click `[SAVE]`
    - Service Account: `primeorbitserviceaccount` - the service account that was created earlier
    - Roles: `BigQuery Data Viewer`, `BigQuery Job User`, `BigQuery Read Session User`, `BigQuery Data Viewer`, `BigQuery Data Transfer Service Agent`
    ![alt text](./images/image-9.png)
7. Click `Save`

```
First time setting up Cloud Billing exports?

If this is the first time you've setup Cloud Billing data exports in BigQuery, please be aware that it can take up to 24-48 hours for your export table to appear. It does not appear until GCP does it's first data drop, which can take a day or two. You can not continue the rest of the connection process until the table has been created.
```
### Create Insights and Recommenders datasets
First, you must configure a Data Transfer for Recommender data in the Google Cloud console. You may already have completed these steps for other purposes, but confirm the steps here match what you have previously set up.

1. Go to `Recommendation Hub` --> BigQuery Export [here](https://console.cloud.google.com/active-assist/export/create?organizationId=743192096802) <br>
![alt text](./images/image-34.png)
1. Set up a Data Transfer in GCP BigQuery by following the [Create a Data Transfer for Recommendations](https://cloud.google.com/recommender/docs/bq-export/export-recommendations-to-bq) instructions.
<br>![alt text](./images/image-36.png)
1. click on `Create`


### 2. Grant Access to PrimeOrbit
1. Log into the GCP Console.
2. Select the Project which holds your Recommender data and go to BigQuery.
3. Find the `insights_export` table.
4. Select that table and click `[+SHARE]`.
5. Click `[+ ADD PRINCIPAL]`.
6. Add the service account and role, then click `[SAVE]`.
    - Service Account: `<po-service-principal>`
    - Role: `BigQuery Data Viewer`

## Collect all the required information with PrimeOrbit
1. Share `JSON Key file` for the Service Account
    <br>Share the downloaded JSON file created for the Service Account.
1. Share `Billing Account ID`    
1. Share `Project ID hosting BigQuery Dataset`    
1. Share `BigQuery Dataset Name` 
1. Share `Fully Qualified Insights Table Name` 
1. Share `Fully Qualified Insights Table Name for Pricing` 
1. Share `Fully Qualified Insights Table Name for Recommendations` 


- For example: `po-billing-only.all_billing_dataset.gcp_billing_export_resource_v1_0127F7_2F14CC_1C4E4E`
    - Project ID: `po-billing-only6`
    - Dataset: `all_billing_dataset`
    - Table name: `gcp_billing_export_resource_v1_0127F7_2F14CC_1C4E4E`
    - Tip: The fully qualified table name will always include the word resource. If this is missing, please reconfirm your export type is Detailed usage cost data.
- JSON Key file that was previously created during Service Account creation for `primeorbitsericeaccount`
