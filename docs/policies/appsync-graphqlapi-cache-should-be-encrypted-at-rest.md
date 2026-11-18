# AWS AppSync API caches should be encrypted at rest

| Provider            |      Category     |
| ------------------- |  ---------------  |
| Amazon Web Services |  Data Protection  |

## Description

This control checks whether an AWS AppSync API cache is encrypted at rest. The control fails if the API cache isn't encrypted at rest.

Data at rest refers to data that's stored in persistent, non-volatile storage for any duration. Encrypting data at rest helps you protect its confidentiality, which reduces the risk that an unauthorized user can access it.

This rule is covered by the [appsync-graphqlapi-cache-should-be-encrypted-at-rest](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/appsync/appsync-graphqlapi-cache-should-be-encrypted-at-rest.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - appsync-graphqlapi-cache-should-be-encrypted-at-rest.sentinel

        Description:
        This policy requires resources of type `aws_appsync_api_cache` should have
        'at_rest_encryption_enabled' should be set to true and 'api_id' should be
        referenced to `aws_appsync_graphql_api` resource.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy appsync-graphqlapi-cache-should-be-encrypted-at-rest.

        ✓ Found 0 resource violations

        appsync-graphqlapi-cache-should-be-encrypted-at-rest.sentinel:80:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - appsync-graphqlapi-cache-should-be-encrypted-at-rest.sentinel

        Description:
        This policy requires resources of type `aws_appsync_api_cache` should have
        'at_rest_encryption_enabled' should be set to true and 'api_id' should be
        referenced to `aws_appsync_graphql_api` resource.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy appsync-graphqlapi-cache-should-be-encrypted-at-rest.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_appsync_api_cache.example
            | ✗ failed
            | AWS AppSync API caches should be encrypted at rest. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/appsync-controls.html#appsync-1 for more details.


        appsync-graphqlapi-cache-should-be-encrypted-at-rest.sentinel:80:1 - Rule "main"
        Value:
            false
```

---
