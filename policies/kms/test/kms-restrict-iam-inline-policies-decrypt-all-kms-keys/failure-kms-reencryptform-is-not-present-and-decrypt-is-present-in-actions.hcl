# Copyright IBM Corp. 2024, 2025
# SPDX-License-Identifier: BUSL-1.1

mock "tfstate/v2" {
	module {
		source = "./mocks/policy-failure-kms-reencryptform-is-not-present-and-decrypt-is-present-in-actions/mock-tfstate-v2.sentinel"
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
		main = false
	}
}