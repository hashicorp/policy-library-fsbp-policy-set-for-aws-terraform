# Ensure S3 Bucket Policy is set to deny HTTP requests

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Storage      |

## Description

This policy evaluates `aws_s3_bucket_policy` resources in the root module and nested modules when their `policy` attribute references an `aws_iam_policy_document` data source.

At the Amazon S3 bucket level, you can configure permissions through a bucket policy making the objects accessible only through HTTPS.

This rule is covered by the [s3-require-ssl](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/s3/s3-require-ssl.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      s3-require-ssl.sentinel

      Description:
        This policy mandates all requests to 'aws_s3_bucket' resources to use ssl using 'aws_s3_bucket_policy' resource.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy s3-require-ssl.

      ✓ Found 0 resource violations

      s3-require-ssl.sentinel:119:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      s3-require-ssl.sentinel

      Description:
        This policy mandates all requests to 'aws_s3_bucket' resources to use ssl using 'aws_s3_bucket_policy' resource.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-require-ssl.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_s3_bucket.example
          | ✗ failed
          | S3 general purpose buckets should require requests to use SSL. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/s3-controls.html#s3-5 for more details.


      s3-require-ssl.sentinel:119:1 - Rule "main"
        Value:
          false
```

---
