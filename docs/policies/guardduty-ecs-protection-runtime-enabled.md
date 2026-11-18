# GuardDuty ECS Runtime Monitoring should be enabled

| Provider            | Category           |
|---------------------|--------------------|
| Amazon Web Services | Detection services |

## Description

This control checks whether the Amazon GuardDuty automated security agent is enabled for runtime monitoring of Amazon ECS clusters on AWS Fargate. For a standalone account, the control fails if the security agent is disabled for the account. In a multi-account environment, the control fails if the security agent is disabled for the delegated GuardDuty administrator account and all member accounts.

In a multi-account environment, this control generates findings only in the delegated GuardDuty administrator account. This is because only the delegated GuardDuty administrator can enable or disable Runtime Monitoring of ECS-Fargate resources for accounts in their organization. GuardDuty member accounts can't do this for their own accounts. In addition, this control generates FAILED findings if GuardDuty is suspended for a member account and Runtime Monitoring of ECS-Fargate resources is disabled for the member account. To receive a PASSED finding, the GuardDuty administrator must disassociate the suspended member account from their administrator account by using GuardDuty.

GuardDuty Runtime Monitoring observes and analyzes operating system-level, networking, and file events to help you detect potential threats in specific AWS workloads in your environment. It uses GuardDuty security agents that add visibility into runtime behavior, such as file access, process execution, command line arguments, and network connections. You can enable and manage the security agent for each type of resource that you want to monitor for potential threats. This includes Amazon ECS clusters on AWS Fargate.

This rule is covered by the [guardduty-ecs-protection-runtime-enabled](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/guardduty/guardduty-ecs-protection-runtime-enabled.sentinel) policy.

## Limitations

With the current Sentinel imports used by this policy, organization-managed ECS-Fargate Runtime Monitoring state cannot be established when the relevant detector and detector feature resources are not present in the Terraform configuration. The policy currently evaluates only configured `aws_guardduty_detector` resources and their `RUNTIME_MONITORING` feature with `ECS_FARGATE_AGENT_MANAGEMENT` in this case. This result does not verify ECS-Fargate Runtime Monitoring for externally or centrally managed organization accounts.

With the current Sentinel imports used by this policy, a detector feature cannot be tied to a specific detector when the detector is created in the same plan, because the detector ID is unknown until apply. The policy currently matches such features by their unknown (empty) detector ID, so with several new detectors in one plan, one detector's feature can satisfy another. This result does not verify per-detector feature coverage for detectors created in the same plan.

## Policy Results (Pass)
```bash
trace:
    Pass - guardduty-ecs-protection-runtime-enabled.sentinel

    Description:
    This policy ensures that GuardDuty ECS Runtime Monitoring
    (EKS_RUNTIME_MONITORING) is enabled.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy guardduty-ecs-protection-runtime-enabled.

    ✓ Found 0 resource violations

    guardduty-ecs-protection-runtime-enabled.sentinel:55:1 - Rule "main"
    Value:
        true
```

---

## Policy Results (Fail)
```bash
trace:
    Fail - guardduty-ecs-protection-runtime-enabled.sentinel

    Description:
    This policy ensures that GuardDuty ECS Runtime Monitoring
    (EKS_RUNTIME_MONITORING) is enabled.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy guardduty-ecs-protection-runtime-enabled.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_guardduty_detector.main
        | ✗ failed
        | GuardDuty ECS Runtime Monitoring should be enabled. Ensure that GuardDuty detector is enabled and Runtime Monitoring feature is enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/guardduty-controls.html#guardduty-12 for more details.


    guardduty-ecs-protection-runtime-enabled.sentinel:55:1 - Rule "main"
    Value:
        false
```

---
