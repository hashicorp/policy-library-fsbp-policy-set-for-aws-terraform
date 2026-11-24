# Copyright IBM Corp. 2024, 2025
# SPDX-License-Identifier: BUSL-1.1

mock "tfplan/v2" {
  module {
    source = "./mocks/policy-success-redshift-cluster-with-automated-snapshot-retention-period-enabled/mock-tfplan-v2.sentinel"
  }
}

mock "tfresources" {
  module {
    source = "../../../../modules/tfresources/tfresources.sentinel"
  }
}

mock "report" {
  module {
    source = "../../../../modules/mocks/report/report.sentinel"
  }
}

param "automated_snapshot_retention_period_lower_limit" {
  value = 15
}

param "automated_snapshot_retention_period_upper_limit" {
  value = 15
}

test {
  rules = {
    main = true
  }
}
