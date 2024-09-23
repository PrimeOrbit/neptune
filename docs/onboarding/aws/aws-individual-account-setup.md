# PrimeOrbit AWS Setup

## Permissions Overview
To understand the permissions PrimeOrbit obtains, please refer to the permissions overview here: [Permission Overview](permissions-overview.md).

## CUR Setup in the Root Account  
1. **Sign in to the account**:
   - Before running the setups, sign in to the AWS Management Console for the root account of your organization: [AWS Management Console](https://console.aws.amazon.com/).
2. **Run the CloudFormation stack** to set up the CUR and IAM user:
   - **CloudFormation Stack URL**:
     [AWS CloudFormation Stack](https://us-east-1.console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://prime-orbit-setup.s3.amazonaws.com/v2/aws_individual_new_cur_setup_v2.yml&stackName=POKeySecretSetupV2m1)

## Member Account Setup Instructions
1. **Run Setup in Each Account**: The quick-setup link below needs to be executed in each AWS member account where access is to be provided.
2. **Sign in to the account**:
   - Before running the setups, sign in to the AWS Management Console for each respective account: [AWS Management Console](https://console.aws.amazon.com/).
3. **Deploy**: Copy and paste the below URL into the browser where you're logged in to the AWS console and start the stack creation.
4. **Retrieve Access Keys**: Once the setup execution succeeds, copy the Access Key & Secret from the `Outputs`. These credentials should be securely shared with PrimeOrbit.

**Member Account Stack URL**:
https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/create/review?templateURL=https://prime-orbit-setup.s3.amazonaws.com/v2/aws-individual-exising-cur-setup-v2.yml&stackName=POKeySecretSetupV2m1&param_ExistingS3BucketForCUR=pocurreport