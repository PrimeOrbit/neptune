## What Permissions Does PrimeOrbit Obtain?

PrimeOrbit does not require any sensitive access permissions. We only obtain read-only permissions to AWS services, **excluding** the sensitive permissions listed below.

We rely on the AWS managed policy: [ReadOnlyAccess](https://docs.aws.amazon.com/aws-managed-policy/latest/reference/ReadOnlyAccess.html).

## Denied Permissions

To protect sensitive information, we explicitly deny access to the following actions:

- `lambda:GetFunction`
- `ssm:GetParameter`
- `secretsmanager:GetSecretValue`
- `iam:ListAccessKeys`
- `s3:GetObject`

**Note:** The `s3:GetObject` permission is required for reading Cost and Usage Reports (CUR) from a specific S3 bucket. No other bucket data is accessible.

## Additional Permissions for Tag Remediation

When you are enabling tag remediation functionality, PrimeOrbit will request the following additional permissions:

- `tag:TagResources`
- `tag:UntagResources` 
- `ec2:CreateTags`
- `ec2:DeleteTags`
- `s3:PutBucketTagging`
- `s3:DeleteBucketTagging`
- `s3:PutObjectTagging`
- `s3:DeleteObjectTagging`
- `lambda:TagResource`
- `lambda:UntagResource`
- `rds:AddTagsToResource`
- `rds:RemoveTagsFromResource`
- `cloudformation:TagResource`
- `cloudformation:UntagResource`
- `eks:TagResource`
- `eks:UntagResource`
- `apigateway:TagResource`
- `apigateway:UntagResource`
- `dynamodb:TagResource`
- `dynamodb:UntagResource`
- `elasticloadbalancing:AddTags`
- `elasticloadbalancing:RemoveTags`
- `elasticache:AddTagsToResource`
- `elasticache:RemoveTagsFromResource`
- `sns:TagResource`
- `sns:UntagResource`
- `sqs:TagQueue`
- `sqs:UntagQueue`
- `ecr:TagResource`
- `ecr:UntagResource`
- `ecs:TagResource`
- `ecs:UntagResource`
- `logs:TagLogGroup`
- `logs:UntagLogGroup`
- `ssm:AddTagsToResource`
- `ssm:RemoveTagsFromResource`
- `secretsmanager:TagResource`
- `secretsmanager:UntagResource`
- `redshift:CreateTags`
- `redshift:DeleteTags`
- `kms:TagResource`
- `kms:UntagResource`
- `cloudfront:TagResource`
- `cloudfront:UntagResource`
- `codebuild:TagResource`
- `codebuild:UntagResource`
- `codecommit:TagResource`
- `codecommit:UntagResource`
- `codepipeline:TagResource`
- `codepipeline:UntagResource`
- `codedeploy:TagResource`
- `codedeploy:UntagResource`
- `cloudtrail:AddTags`
- `cloudtrail:RemoveTags`
- `batch:TagResource`
- `batch:UntagResource`
- `config:TagResource`
- `config:UntagResource`
- `appsync:TagResource`
- `appsync:UntagResource`
- `acm:AddTagsToCertificate`
- `acm:RemoveTagsFromCertificate`
- `elasticfilesystem:TagResource`
- `elasticfilesystem:UntagResource`
- `iam:TagRole`
- `iam:UntagRole`
- `iam:TagUser`
- `iam:UntagUser`
- `iam:TagGroup`
- `iam:UntagGroup`
- `iam:TagPolicy`
- `iam:UntagPolicy`
- `route53:ChangeTagsForResource`
- `route53domains:TagResource`
- `route53domains:UntagResource`
- `waf:TagResource`
- `waf:UntagResource`
- `wafv2:TagResource`
- `wafv2:UntagResource`
- `workspaces:CreateTags`
- `workspaces:DeleteTags`
- `autoscaling:CreateOrUpdateTags`
- `autoscaling:DeleteTags`
- `events:TagResource`
- `events:UntagResource`
- `efs:CreateTags`
- `efs:DeleteTags`
- `transfer:TagResource`
- `transfer:UntagResource`
- `cloudwatch:TagResource`
- `cloudwatch:UntagResource`
- `glue:TagResource`
- `glue:UntagResource`
- `sagemaker:AddTags`
- `sagemaker:DeleteTags`
- `elasticbeanstalk:TagResource`
- `elasticbeanstalk:UntagResource`
- `cloudhsm:AddTagsToResource`
- `cloudhsm:RemoveTagsFromResource`
- `fsx:TagResource`
- `fsx:UntagResource`
- `kinesis:AddTagsToStream`
- `kinesis:RemoveTagsFromStream`
- `kinesisvideo:TagStream`
- `kinesisvideo:UntagStream`
- `guardduty:TagResource`
- `guardduty:UntagResource`
- `servicecatalog:TagResource`
- `servicecatalog:UntagResource`
- `backup:TagResource`
- `backup:UntagResource`
- `elasticmapreduce:AddTags`
- `elasticmapreduce:RemoveTags`
- `mediapackage:TagResource`
- `mediapackage:UntagResource`
- `mediatailor:TagResource`
- `mediatailor:UntagResource`
- `neptune:AddTagsToResource`
- `neptune:RemoveTagsFromResource`
- `swf:AddTags`
- `swf:RemoveTags`
- `es:AddTags`
- `es:RemoveTags`
- `elastictranscoder:TagResource`
- `elastictranscoder:UntagResource`
- `glacier:AddTagsToVault`
- `glacier:RemoveTagsFromVault`
- `iot:TagResource`
- `iot:UntagResource`
- `mq:TagResource`
- `mq:UntagResource`
- `logs:TagResource`
- `logs:UntagResource`
