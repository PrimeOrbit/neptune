# PrimeOrbit AWS Setup
 
To integrate PrimeOrbit with your AWS accounts, you will need to complete two types of setup:

1. **Root Account Setup**: This is required for setting up the Cost and Usage Report (CUR) in the root account of your AWS organization. This setup involves creating the CUR and configuring the necessary IAM permissions.

2. **Member Account Setup**: This needs to be done for each member account where PrimeOrbit access is required. The setup involves creating the necessary IAM permissions.

Each setup involves deploying a CloudFormation stack and retrieving the required access keys. Follow the detailed instructions below to complete the process.

## Permissions Overview
To understand the permissions PrimeOrbit obtains, please refer to the permissions overview here: [Permission Overview](permissions-overview.md).


## CUR Setup in the Root Account 
The CUR (Cost and Usage Report) setup should only be performed in the root account of the AWS organization. Please follow the steps below: 
1. **Sign in to the account**:
   - Before running the setups, sign in to the AWS Management Console for the root account of your organization: [AWS Management Console](https://console.aws.amazon.com/).
2. **Deploy the stack**: Copy and paste the below URL into the browser where you're logged in to the AWS console and start the stack creation.
3. **Retrieve Access Keys**: Once the setup execution succeeds, copy the Access Key & Secret from the `Outputs`. These credentials should be securely shared with PrimeOrbit.

**CloudFormation Stack URL for root account**:
https://us-east-1.console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://prime-orbit-setup.s3.amazonaws.com/v2/aws_individual_new_cur_setup_v2.yml&stackName=POKeySecretSetupV2m1

## Member Account Setup Instructions
1. **Run Setup in Each Account**: The quick-setup link below needs to be executed in each AWS member account where access is to be provided.
2. **Sign in to the account**:
   - Before running the setups, sign in to the AWS Management Console for each respective account: [AWS Management Console](https://console.aws.amazon.com/).
3. **Deploy the stack**: Copy and paste the below URL into the browser where you're logged in to the AWS console and start the stack creation.
4. **Retrieve Access Keys**: Once the setup execution succeeds, copy the Access Key & Secret from the `Outputs`. These credentials should be securely shared with PrimeOrbit.

**CloudFormation Stack URL for member accounts**:
https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/create/review?templateURL=https://prime-orbit-setup.s3.amazonaws.com/v2/aws-individual-exising-cur-setup-v2.yml&stackName=POKeySecretSetupV2m1&param_ExistingS3BucketForCUR=pocurreport