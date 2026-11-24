# AWS AppSync should have field-level logging enabled

| Provider            |      Category     |
| ------------------- |  ---------------  |
| Amazon Web Services |  Data Protection  |

## Description

This control checks whether an AWS AppSync API has field-level logging turned on. The control fails if the field resolver log level is set to None. Unless you provide custom parameter values to indicate that a specific log type should be enabled, Security Hub produces a passed finding if the field resolver log level is either ERROR or ALL.

This rule is covered by the [appsync-field-level-logging-should-be-enabled](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/appsync/appsync-field-level-logging-should-be-enabled.sentinel) policy.

## Parameters

| Parameter | Description | Type | Default | Constraints |
| --- | --- | --- | --- | --- |
| `field_log_level_options` | Field logging level. A GraphQL API passes when its field resolver log level is one of these levels. | `list(string)` | `["ERROR", "ALL"]` | `{ allowed_values: ["ERROR", "ALL", "INFO", "DEBUG"], min_items: 1 }` |

## Policy Results (Pass)

```bash
trace:
        Pass - appsync-field-level-logging-should-be-enabled.sentinel

        Description:
        This policy requires resources of type `aws_appsync_graphql_api` have
        attribute "log_config" with "field_log_level" set to "ERROR" or "ALL".

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy appsync-field-level-logging-enabled.

        ✓ Found 0 resource violations

        appsync-field-level-logging-should-be-enabled.sentinel:57:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - appsync-field-level-logging-should-be-enabled.sentinel

        Description:
        This policy requires resources of type `aws_appsync_graphql_api` have
        attribute "log_config" with "field_log_level" set to "ERROR" or "ALL".

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy appsync-field-level-logging-enabled.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_appsync_graphql_api.example
            | ✗ failed
            | Attribute 'log_config' with 'field_log_level' must be set to 'ERROR' or 'ALL' for 'aws_appsync_graphql_api' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/appsync-controls.html#appsync-2 for more details.


        appsync-field-level-logging-should-be-enabled.sentinel:57:1 - Rule "main"
        Value:
            false
```

---
