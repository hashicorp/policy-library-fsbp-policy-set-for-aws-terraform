# S3 general purpose bucket policies should restrict access to other AWS accounts

| Provider            |           Category          |
|---------------------| --------------------------- |
| Amazon Web Services | Secure Access Configuration |

## Description

This control checks whether an Amazon S3 general purpose bucket policy prevents principals from other AWS accounts from performing denied actions on resources in the S3 bucket. The control fails if the bucket policy allows one or more of the preceding actions for a principal in another AWS account.

Implementing least privilege access is fundamental to reducing security risk and the impact of errors or malicious intent. If an S3 bucket policy allows access from external accounts, it could result in data exfiltration by an insider threat or an attacker.

This rule is covered by the [s3-bucket-policy-restrict-access-to-other-accounts](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/s3/s3-bucket-policy-restrict-access-to-other-accounts.sentinel) policy.

## Limitations

The policy evaluates `aws_s3_bucket_policy` resources from state and from the plan, and links each one to an `aws_iam_policy_document` data source whose rendered JSON matches the bucket policy. With the current Sentinel imports used by this policy, that link cannot be established when the bucket policy is written as inline JSON rather than from a policy document data source, or when the document is only rendered at apply time (for example, because it references a bucket ARN that is unknown until apply). The policy currently does not evaluate such bucket policies. This result does not verify them.

With the current Sentinel imports used by this policy, the owning AWS account cannot be established. To preserve the policy's existing handling of unknown account ownership, any bucket-attached policy document containing an Allow statement for a restricted S3 action is rejected, whether its principal is wildcard, a named principal from the bucket owner's account, or a named principal from another account. The policy therefore cannot distinguish same-account from cross-account grants and remains intentionally overbroad; it does not provide full cross-account correctness.

With the current Sentinel imports used by this policy, the effective access granted by IAM conditions cannot be established when evaluating condition-dependent principals. The policy currently preserves its direct principal and action checks in this case. This result does not verify the full effective IAM authorization decision.

## Policy Results (Pass)
```bash
trace:
        Pass - s3-bucket-policy-restrict-access-to-other-accounts.sentinel

        Description:
        S3 general purpose bucket policies should restrict access to other AWS
        accounts

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy s3-bucket-policy-restrict-access-to-other-accounts.

        ✓ Found 0 resource violations

        s3-bucket-policy-restrict-access-to-other-accounts.sentinel:59:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)
```bash
trace:
        Fail - s3-bucket-policy-restrict-access-to-other-accounts.sentinel

        Description:
        S3 general purpose bucket policies should restrict access to other AWS accounts

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-bucket-policy-restrict-access-to-other-accounts.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_s3_bucket_policy.attached
            | ✗ failed
            | S3 general purpose bucket policies should restrict access to other AWS accounts. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/s3-controls.html#s3-6 for more details.


        s3-bucket-policy-restrict-access-to-other-accounts.sentinel:110:1 - Rule "main"
        Value:
            false
```

---
