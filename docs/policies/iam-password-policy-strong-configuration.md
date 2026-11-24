# Password policies for IAM users should have strong configurations

| Provider            |         Category         |
| ------------------- | ------------------------ |
| Amazon Web Services | Secure Access Management |

## Description

This control checks whether the account password policy for IAM users uses strong configurations. The control fails if the password policy doesn't use strong configurations. Unless you provide custom parameter values, Security Hub uses the default values mentioned in the preceding table. The PasswordReusePrevention and MaxPasswordAge parameters have no default value, so if you exclude these parameters, Security Hub ignores number of password rotations and password age when evaluating this control.

This rule is covered by the [iam-password-policy-strong-configuration](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/iam/iam-password-policy-strong-configuration.sentinel) policy.

## Parameters

| Parameter | Description | Type | Default | Constraints |
| --- | --- | --- | --- | --- |
| `require_uppercase_characters_param` | Require at least one uppercase character in password | `bool` | `true` | - |
| `require_lowercase_characters_param` | Require at least one lowercase character in password | `bool` | `true` | - |
| `require_symbols_param` | Require at least one symbol in password | `bool` | `true` | - |
| `require_numbers_param` | Require at least one number in password | `bool` | `true` | - |
| `minimum_password_length_param` | Minimum number of characters in the password | `number` | `8` | `{ min: 8, max: 128, integer: true }` |
| `min_password_reuse_prevention_param` | Number of password rotations before an old password can be reused | `number` | `12` | `{ min: 12, max: 24, integer: true }` |
| `max_password_age_param` | Number of days before password expiration | `number` | `90` | `{ min: 1, max: 90, integer: true }` |

## Limitations

The policy correlates each planned `aws_iam_account_password_policy` resource with its exact `tfconfig/v2` address. When configuration proves that any of `require_lowercase_characters`, `require_uppercase_characters`, `require_numbers`, or `require_symbols` was omitted, the policy evaluates the provider's omitted value as `false`; explicit planned boolean values are evaluated against the corresponding policy parameters.

With the current Sentinel imports used by this policy, the eventual value of a configured but unresolved password requirement cannot be established when planned values omit the attribute. The policy retains its original fallback for that case, and also when no matching configuration resource is available. If an unresolved attribute is present as explicit `null` in planned values, the original explicit-null behavior is retained and the resource fails. These fallback results do not verify the eventual password-policy flag value.

## Policy Results (Pass)
```bash
trace:
        Pass - iam-password-policy-strong-configuration.sentinel

        Description:
        This policy requires that the `aws_iam_account_password_policy` resource
        have the strong configurations

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy iam-password-uppercase.

        ✓ Found 0 resource violations

        iam-password-policy-strong-configuration.sentinel:101:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)
```bash
trace:
        Fail - iam-password-policy-strong-configuration.sentinel

        Description:
        This policy requires that the `aws_iam_account_password_policy` resource
        have the strong configurations

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy iam-password-uppercase.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_iam_account_password_policy.policy
            | ✗ failed
            | Resource 'aws_iam_account_password_policy' must have strong configuration. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/iam-controls.html#iam-7 for more details.


        iam-password-policy-strong-configuration.sentinel:101:1 - Rule "main"
        Value:
            false
```

---
