# PrimeOrbit AWS Access Setup

## Permissions Overview
Please refer to the permissions overview here: [Permission Overview](permissions-overview.md).

## Setup Scenario
This document covers the instrcutions to setup the **An individual account with _existing_ CUR report (Single/Multi Accounts, UsingKeySecret)** scenario.

Please refer to the complete [AWS Setup Secenarios](setup-scenarios.md).  


## Remove the Previous Setup/Stack from each account
1. **Sign in to the AWS CloudFormation Console**: Use this link to access the console: [AWS CloudFormation console](https://console.aws.amazon.com/cloudformation).
2. **Select the Previous Stack**: 
   - From the list of stacks, select the previously installed stack that needs to be deleted.
   - **Note**: Ensure the correct region and stack are selected. In our records, the region is `us-west-2`.
3. **Delete the Stack**:
   - Click the *Delete* button at the top.
   - When prompted for confirmation, confirm the *Delete* action.
4. Ensure that the stack deletion is performed for all the accounts


## New Setup | General Instructions
1. **Run Setup in Each Account**: The quick-setup link below need to be executed in each AWS account where access is to be provided.
2. **Sign in to the account**:
   - Before running the setups, sign in to the AWS Management Console for each respective account: [AWS Management Console](https://console.aws.amazon.com/).

## Setup the access roles:
1. **Parameters**: Ensure that the `region` and `ExistingS3BucketForCUR` parameters are correctly specified, it is `us-west-2`, `primeorbit-curreports` used in it. Other prameters can also be updated before deploy.
2. **Deploy**: Copy and paste the URL into the browser where you're logged in to the AWS console and start the stack creation.
3. **Retrieve Access Keys**: Once the setup execution succeeds, copy the Access Key & Secret from the `Outputs`. These credentials should be securely shared with PrimeOrbit.

**URL**:
https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/create/review?templateURL=https://prime-orbit-setup.s3.amazonaws.com/v2/aws-individual-exising-cur-setup-v2.yml&stackName=POKeySecretSetupV2m1&param_ExistingS3BucketForCUR=primeorbit-curreports

## Important Notice
Handling keys and secrets requires careful security practices and diligence. We also support a Keyless access mechanism, which we recommend as a more secure alternative. If you would like to learn more about the Keyless approach, please do not hesitate to reach out for further information.