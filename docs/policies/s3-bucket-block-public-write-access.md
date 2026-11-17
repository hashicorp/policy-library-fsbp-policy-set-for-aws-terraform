# S3 general purpose buckets should block public write access

| Provider            |           Category           |
|---------------------| ---------------------------- |
| Amazon Web Services | Secure Network Configuration |

## Description

This control checks whether an Amazon S3 general purpose bucket permits public write access. It evaluates the block public access settings, the bucket policy, and the bucket access control list (ACL). The control fails if the bucket permits public write access.

Some use cases require that everyone on the internet be able to write to your S3 bucket. However, those situations are rare. To ensure the integrity and security of your data, your S3 bucket should not be publicly writable.

This rule is covered by the [s3-bucket-block-public-write-access](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/s3/s3-bucket-block-public-write-access.sentinel) policy.

## Limitations

This policy does not evaluate IAM statement conditions. It determines public write access from the direct principal, action, and effect fields, so a restricting condition does not change the result of that check. Condition-effective access remains unsupported.

## Policy Results (Pass)
```bash
trace:
        Pass - s3-bucket-block-public-write-access.sentinel

        Description:
        S3 general purpose buckets should block public write access

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy s3-bucket-block-public-write-access.

        ✓ Found 0 resource violations

        s3-bucket-block-public-write-access.sentinel:110:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)
```bash
trace:
        Fail - s3-bucket-block-public-write-access.sentinel

        Description:
        S3 general purpose buckets should block public write access

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-bucket-block-public-write-access.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_s3_bucket_acl.example
            | ✗ failed
            | S3 general purpose buckets should block public write access. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/s3-controls.html#s3-3 for more details.


        s3-bucket-block-public-write-access.sentinel:110:1 - Rule "main"
        Value:
            false
```

---
