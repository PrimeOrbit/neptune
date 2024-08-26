# Scenarios for customer AWS account setup (V2): 

## 1. An individual account with _existing_ CUR report (Single Account, Keyless)
- Highlights:
    - Role based permission configuration
    - CUR already present, will utilise the same
    - CUR bucket read/write permissions additionally opted
- Actions needed:
    - Run 1 script to have the roles configured  
    - Run another 1 for getting the the access key and secret (Skip this step for keyless)

## 2. An individual account with _new_ CUR report (Single Account, Keyless)
- Highlights:
    - Role based permission configuration
    - CUR not present, hence will also setup CUR and its s3 bucket
- Actions needed:
    - Run 1 script to have the roles configured, CUR created  
    - Run another 1 for getting the the access key and secret (Skip this step for keyless)

## 3. An individual account with _existing_ CUR report (Single/Multi Accounts, UsingKeySecret)
- Highlights:
    - User and group based permission configuration
    - CUR already present, will utilise the same
    - CUR bucket read/write permissions additionally opted
- Actions needed:
    - Run 1 script to have the user, group configured 
    - Access Key & Secret from the "Outputs" should be securely shared with PrimeOrbit.

## 4. An organization account with _existing_ CUR report (Keyless, InclusiveMembers)
- Highlights:
    - Will generate access for all the accounts in the oraganisation (root account and it's member accounts)
    - Role based permission configuration
    - CUR already present, will utilise the same
    - CUR bucket read/write permissions additionally opted
    - Target account be selected as PO or own account
- Actions needed:
    - Run 1 script to have the roles configured  
    - Run another 1 for getting the the access key and secret (Skip this step for keyless / using PO target account / earlier ran)

## 5. An organization account with _new_ CUR report (Keyless, InclusiveMembers)
- Highlights:
    - Will generate access for all the accounts in the oraganisation (root account and it's member accounts)
    - Role based permission configuration
    - CUR not present, hence will generate the same and its s3 bucket
    - Target account be selected as PO or own account
- Actions needed:
    - Run 1 script to have the roles configured, CUR created   
    - Run another 1 for getting the the access key and secret (Skip this step for keyless / using PO target account / earlier ran)