# Amazon EC2 paravirtual instance types should not be used

| Provider            |      Category      |
| ------------------- | ------------------ |
| Amazon Web Services |  Network Security  |

## Description

DISCLAIMER - This policy works when all resources of type aws_instance and aws_ami to be in the root module and When Amazon Machine Images (AMIs) are created using image generation tools such as HashiCorp Packer, policies will fail, regardless of whether the underlying virtualization is paravirtualized.

This control checks whether the virtualization type of an EC2 instance is paravirtual. The control fails if the virtualizationType of the EC2 instance is set to paravirtual.

Linux Amazon Machine Images (AMIs) use one of two types of virtualization: paravirtual (PV) or hardware virtual machine (HVM). The main differences between PV and HVM AMIs are the way in which they boot and whether they can take advantage of special hardware extensions (CPU, network, and storage) for better performance.

This rule is covered by the [ec2-instance-virtualization-should-not-be-paravirtual](https://github.com/hashicorp/policy-library-FSBP-Policy-Set-for-AWS-Terraform/blob/main/policies/ec2/ec2-instance-virtualization-should-not-be-paravirtual.sentinel) policy.

## Limitations

The policy checks the AMI each `aws_instance` references. For a managed `aws_ami` resource it reads `virtualization_type` from configuration. For an `aws_ami` data source it reads the result Terraform fetched during plan, from `tfstate/v2`.

With the current Sentinel imports used by this policy, an instance AMI's virtualization type cannot be established when `ami` is a literal ID, or when it comes from an `aws_ami` data source that Terraform only reads at apply time (for example, because its arguments depend on values unknown until apply). The policy currently does not report a virtualization violation for those AMIs. This result does not verify that such an AMI uses HVM virtualization.

## Policy Results (Pass)

```bash
trace:
        Pass - ec2-instance-virtualization-should-not-be-paravirtual.sentinel

        Description:
        This policy requires `aws_ami` resources to have attribute
        'virtualization_type' to be 'hvm'.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy ec2-instance-virtualization-should-not-be-paravirtual.

        ✓ Found 0 resource violations

        ec2-instance-virtualization-should-not-be-paravirtual.sentinel:94:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - ec2-instance-virtualization-should-not-be-paravirtual.sentinel

        Description:
        This policy requires `aws_ami` resources to have attribute
        'virtualization_type' to be 'hvm'.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-instance-virtualization-should-not-be-paravirtual.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_instance.name
            | ✗ failed
            | Attribute 'virtualization_type' must be 'hvm' for 'aws_ami' linked with the 'aws_instance' resource. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-24 for more details.


        ec2-instance-virtualization-should-not-be-paravirtual.sentinel:94:1 - Rule "main"
        Value:
            false
```

---
