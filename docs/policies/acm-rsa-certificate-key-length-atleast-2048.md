# RSA certificates managed by ACM should use a key length of at least 2,048 bits

| Provider            |       Category      |
| ------------------- |  -----------------  |
| Amazon Web Services |   Data Protection   |

## Description

This control checks whether RSA certificates managed by AWS Certificate Manager use a key length of at least 2,048 bits. The control fails if the key length is smaller than 2,048 bits.

The strength of encryption directly correlates with key size. We recommend key lengths of at least 2,048 bits to protect your AWS resources as computing power becomes less expensive and servers become more advanced.

This rule is covered by the [acm-rsa-certificate-key-length-atleast-2048](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/acm/acm-rsa-certificate-key-length-atleast-2048.sentinel) policy.

When `key_algorithm` is omitted for a new ACM certificate request, the policy applies the ACM `RSA_2048` request default.

## Limitations

With the current Sentinel imports used by this policy, the certificate key algorithm cannot be established when an imported certificate or another existing certificate has an unresolved `key_algorithm`. The policy currently reports a violation in this case. This result does not verify that the certificate uses an RSA key length of at least 2,048 bits.

## Policy Results (Pass)

```bash
trace:
        Pass - acm-rsa-certificate-key-length-atleast-2048.sentinel

        Description:
        This policy requires resources of type `aws_acm_certificate` with rsa key
        algorithm should have atleast 2048 bits key length.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy acm-rsa-certificate-key-length-atleast-2048.

        ✓ Found 0 resource violations

        acm-rsa-certificate-key-length-atleast-2048.sentinel:60:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - acm-rsa-certificate-key-length-atleast-2048.sentinel

        Description:
        This policy requires resources of type `aws_acm_certificate` with rsa key
        algorithm should have atleast 2048 bits key length.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy acm-rsa-certificate-key-length-atleast-2048.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_acm_certificate.cert
            | ✗ failed
            | ACM Certificate should have at least 2048 bits key length for rsa algorithm. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/acm-controls.html#acm-2 for more details.


        acm-rsa-certificate-key-length-atleast-2048.sentinel:60:1 - Rule "main"
        Value:
            false
```

---
