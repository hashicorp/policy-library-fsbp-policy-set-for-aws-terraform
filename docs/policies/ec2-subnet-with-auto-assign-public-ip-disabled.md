# Amazon EC2 subnets should not automatically assign public IP addresses

| Provider            |     Category     |
|---------------------| ---------------- |
| Amazon Web Services | Network Security |

## Description

This control checks whether the assignment of public IPs in Amazon Virtual Private Cloud (Amazon VPC) subnets have MapPublicIpOnLaunch set to FALSE. The control passes if the flag is set to FALSE.

All subnets have an attribute that determines whether a network interface created in the subnet automatically receives a public IPv4 address. Instances that are launched into subnets that have this attribute enabled have a public IP address assigned to their primary network interface.

This rule is covered by the [ec2-subnet-with-auto-assign-public-ip-disabled](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/ec2/ec2-subnet-with-auto-assign-public-ip-disabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:

    Pass - ec2-subnet-with-auto-assign-public-ip-disabled.sentinel

    Description:
    This policy requires `aws_subnet` resources to have attribute
    'map_public_ip_on_launch' to be false.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy ec2-subnet-with-auto-assign-public-ip-disabled.

    ✓ Found 0 resource violations

    ec2-subnet-with-auto-assign-public-ip-disabled.sentinel:45:1 - Rule "main"
    Value:
        true

```

---

## Policy Results (Fail)
```bash
trace:

    Fail - ec2-subnet-with-auto-assign-public-ip-disabled.sentinel

    Description:
    This policy requires `aws_subnet` resources to have attribute
    'map_public_ip_on_launch' to be false.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-subnet-with-auto-assign-public-ip-disabled.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_subnet.main
        | ✗ failed
        | Attribute 'map_public_ip_on_launch' must be false for 'aws_subnet' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-15 for more details.


    ec2-subnet-with-auto-assign-public-ip-disabled.sentinel:45:1 - Rule "main"
    Value:
        false
        
```
---