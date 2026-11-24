# Security groups should only allow unrestricted incoming traffic for authorized ports

| Provider            |   Category   |
|---------------------| ------------ |
| Amazon Web Services |   Security   |

## Description

DISCLAIMER - This policy works when all resources of type aws_security_group, aws_security_group_rule and the attribute `service_name` attribute is used to define the service.

This control checks whether an Amazon EC2 security group permits unrestricted incoming traffic from unauthorized ports. The control status is determined as follows:

- If you use the default value for authorizedTcpPorts, the control fails if the security group permits unrestricted incoming traffic from any port other than ports 80 and 443.

- If you provide custom parameter values for authorized_tcp_ports or authorized_udp_ports in the [sentinel.hcl](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/sentinel.hcl) file for the policy, the control fails if the security group permits unrestricted incoming traffic from any unlisted port.

This rule is covered by the [ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/ec2/ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports.sentinel) policy.

## Parameters

| Parameter | Description | Type | Default | Constraints |
| --- | --- | --- | --- | --- |
| `authorized_tcp_ports` | List of authorized TCP ports | `list(number)` | `[80, 443]` | `{ min: 1, max: 65535, integer: true, min_items: 1, max_items: 32 }` |
| `authorized_udp_ports` | List of authorized UDP ports | `list(number)` | `[]` | `{ min: 1, max: 65535, integer: true, min_items: 1, max_items: 32 }` |

## Policy Results (Pass)
```bash
trace:
    Pass - ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports.sentinel

    Description:
    Security groups should only allow unrestricted incoming traffic for authorized
    ports

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports.

    ✓ Found 0 resource violations

    ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports.sentinel:141:1 - Rule "main"
    Value:
        true

    ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports.sentinel:131:1 - Rule "is_aws_security_group_compliant"
    Description:
        Checks if 'aws_security_group' resources block ingress traffic
        from unknown sources to the configured ports

    Value:
        true

    ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports.sentinel:125:1 - Rule "is_aws_security_group_rule_compliant"
    Description:
        Checks if 'aws_security_group_rule' resources block ingress
        traffic
        from unknown sources to the configured ports

    Value:
        true

    ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports.sentinel:137:1 - Rule "is_aws_vpc_security_group_ingress_rule_compliant"
    Description:
        Checks if 'aws_vpc_security_group_ingress_rule' resources block
        ingress traffic
        from unknown sources to the configured ports

    Value:
        true
```

---

## Policy Results (Fail)
```bash
trace:
    Fail - ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports.sentinel

    Description:
    Security groups should only allow unrestricted incoming traffic for authorized
    ports

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_vpc_security_group_ingress_rule.this
        | ✗ failed
        | Security group rules should not allow ingress from 0.0.0.0/0 or ::/0 to unauthorized ports. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-18 for more details.


    ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports.sentinel:141:1 - Rule "main"
    Value:
        false

    ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports.sentinel:131:1 - Rule "is_aws_security_group_compliant"
    Description:
        Checks if 'aws_security_group' resources block ingress traffic
        from unknown sources to the configured ports

    Value:
        true

    ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports.sentinel:125:1 - Rule "is_aws_security_group_rule_compliant"
    Description:
        Checks if 'aws_security_group_rule' resources block ingress
        traffic
        from unknown sources to the configured ports

    Value:
        true

    ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports.sentinel:137:1 - Rule "is_aws_vpc_security_group_ingress_rule_compliant"
    Description:
        Checks if 'aws_vpc_security_group_ingress_rule' resources block
        ingress traffic
        from unknown sources to the configured ports

    Value:
        false
```

---