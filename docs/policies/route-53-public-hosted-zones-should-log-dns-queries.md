# Route 53 public hosted zones should log DNS queries

| Provider            | Category |
| ------------------- | -------- |
| Amazon Web Services | Logging  |

## Description

This control checks if DNS query logging is enabled for an Amazon Route 53 public hosted zone. The control fails if DNS query logging isn't enabled for a Route 53 public hosted zone.

Logging DNS queries for a Route 53 hosted zone addresses DNS security and compliance requirements and grants visibility. The logs include information such as the domain or subdomain that was queried, the date and time of the query, the DNS record type (for example, A or AAAA), and the DNS response code (for example, NoError or ServFail). When DNS query logging is enabled, Route 53 publishes the log files to Amazon CloudWatch Logs.

This rule is covered by the [route-53-public-hosted-zones-should-log-dns-queries](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/route53/route-53-public-hosted-zones-should-log-dns-queries.sentinel) policy.

## Limitations

With the current Sentinel imports used by this policy, a query log cannot be associated with a managed public zone when the query log's `zone_id` is supplied as a literal value rather than a Terraform reference to that zone. The policy currently reports the zone as a violation in this case. This result does not verify whether DNS query logging is enabled for the deployed zone.

With the current Sentinel imports used by this policy, the query log reference cannot be matched to a zone declared inside a module, because the reference is module-local while the zone address includes the module path. The policy currently reports such a zone as a violation. This result does not verify whether DNS query logging is enabled for a module-declared zone.

## Policy Results (Pass)

```bash
trace:
      Pass - route-53-public-hosted-zones-should-log-dns-queries.sentinel

      Description:
        This control checks if DNS query logging is enabled for an Amazon Route 53
        public hosted zone.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy route-53-public-hosted-zones-should-log-dns-queries.

      ✓ Found 0 resource violations

      route-53-public-hosted-zones-should-log-dns-queries.sentinel:67:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)

```bash
trace:
      Fail - route-53-public-hosted-zones-should-log-dns-queries.sentinel

      Description:
        This control checks if DNS query logging is enabled for an Amazon Route 53
        public hosted zone.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy route-53-public-hosted-zones-should-log-dns-queries.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_route53_query_log.query_log_1
          | ✗ failed
          | Route 53 public hosted zones should log DNS queries. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/route53-controls.html#route53-2 for more details.


      route-53-public-hosted-zones-should-log-dns-queries.sentinel:67:1 - Rule "main"
        Value:
          false
```

---
