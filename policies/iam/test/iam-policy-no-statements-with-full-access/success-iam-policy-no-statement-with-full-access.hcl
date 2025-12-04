# Copyright IBM Corp. 2024, 2025
# SPDX-License-Identifier: BUSL-1.1

mock "tfstate/v2" {
	module {
		source = "./mocks/policy-success-iam-policy-no-statement-with-full-access/mock-tfstate-v2.sentinel"
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

test {
	rules = {
		main = true
	}
}