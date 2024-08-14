Scenarios for customer AWS account setup (V2): 

# 1. An individual account with existing CUR report
- Highlights:
    - Role based permission configuration
    - CUR already present, will utilise the same
    - CUR bucket read/write permissions additionally opted
- Actions needed:
    - Run 1 script to have the roles configured  
    - Run another 1 for getting the the access key and secret (Skip this step for keyless)

# 2. An individual account with new CUR report
- Highlights:
    - Role based permission configuration
    - CUR not present, hence will also setup CUR and its s3 bucket
- Actions needed:
    - Run 1 script to have the roles configured, CUR created  
    - Run another 1 for getting the the access key and secret (Skip this step for keyless)

# 3. An organization account with existing CUR report
- Highlights:
    - Will generate access for all the accounts in the oraganisation (all member accounts, root account)
    - Role based permission configuration
    - CUR already present, will utilise the same
    - CUR bucket read/write permissions additionally opted
    - Target account be selected as PO or own account
- Actions needed:
    - Run 1 script to have the roles configured  
    - Run another 1 for getting the the access key and secret (Skip this step for keyless / using PO target account / earlier ran)

# 4. An organization account with new CUR report
- Highlights:
    - Will generate access for all the accounts in the oraganisation (all member accounts, root account)
    - Role based permission configuration
    - CUR not present, hence will generate the same and its s3 bucket
    - Target account be selected as PO or own account
- Actions needed:
    - Run 1 script to have the roles configured, CUR created   
    - Run another 1 for getting the the access key and secret (Skip this step for keyless / using PO target account / earlier ran)
