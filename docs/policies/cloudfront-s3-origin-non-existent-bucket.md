# CloudFront distributions should not point to non-existent S3 origins

| Provider            |         Category       |
|---------------------| -----------------------|
| Amazon Web Services | Resource configuration |

## Description

DISCLAIMER - This policy works when all resources of type aws_cloudfront_distribution and aws_s3_bucket are present in the root module.

This control checks whether Amazon CloudFront distributions are pointing to non-existent Amazon S3 origins. The control fails for a CloudFront distribution if the origin is configured to point to a non-existent bucket. This control only applies to CloudFront distributions where an S3 bucket without static website hosting is the S3 origin.

## Limitations

With the current Sentinel imports used by this policy, S3 bucket existence cannot be established when an origin uses a literal S3 domain name rather than a reference to an `aws_s3_bucket` resource in the Terraform configuration. The policy currently does not report a violation for that literal-domain origin. This result does not verify that the referenced S3 bucket exists.

When a CloudFront distribution in your account is configured to point to a non-existent bucket, a malicious third party can create the referenced bucket and serve their own content through your distribution. We recommend checking all origins regardless of routing behavior to ensure that your distributions are pointing to appropriate origins.

This rule is covered by the [cloudfront-s3-origin-non-existent-bucket](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/cloudfront/cloudfront-s3-origin-non-existent-bucket.sentinel) policy.

## Policy Results (Pass)
```bash
trace:

    Pass - cloudfront-s3-origin-non-existent-bucket.sentinel

    Description:
    This policy checks whether 'aws_cloudfront_distribution' are pointing to
    non-existent Amazon S3 origins.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy cloudfront-s3-origin-non-existent-bucket.

    ✓ Found 0 resource violations

    cloudfront-s3-origin-non-existent-bucket.sentinel:89:1 - Rule "main"
    Value:
        true

```

---

## Policy Results (Fail)
```bash
trace:

    Fail - cloudfront-s3-origin-non-existent-bucket.sentinel

    Description:
    This policy checks whether 'aws_cloudfront_distribution' are pointing to
    non-existent Amazon S3 origins.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudfront-s3-origin-non-existent-bucket.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_cloudfront_distribution.invalid_origin
        | ✗ failed
        | 'aws_cloudfront_distribution' should not point to non-existent Amazon S3 origins. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudfront-controls.html#cloudfront-12 for more details.


    cloudfront-s3-origin-non-existent-bucket.sentinel:89:1 - Rule "main"
    Value:
        false
        
```
---
