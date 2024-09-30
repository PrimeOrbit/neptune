# PrimeOrbit AWS Individual Account Setup 
To integrate PrimeOrbit with your AWS Individual accounts, follow the setup instructions below. This guide will walk you through deploying a CloudFormation stack to enable the integration.

## Permissions Overview
To understand the permissions PrimeOrbit obtains, please refer to the permissions overview here: [Permission Overview](permissions-overview.md).

## AWS Individual Account Setup Instructions

1. **Sign in to the AWS Account**:
   - Before starting the setup, sign in to the AWS Management Console for the: [AWS Management Console](https://console.aws.amazon.com/).   

2. **Deploy the CloudFormation Stack**: Use the link/URL below to start the CloudFormation stack creation in the AWS console

   **CloudFormation Stack URL for Individual Account**:
[Deploy Stack](https://us-east-1.console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://prime-orbit-setup.s3.amazonaws.com/v2/aws-individual-new-cur-setup-v2.yml&param_TargetAccountId=115525691254&stackName=POKeylessSetupV2R1)

4. **Verify Setup**: After the stack has been deployed, ensure that the setup has completed successfully by checking the status of the execution in the AWS CloudFormation console.