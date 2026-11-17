# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1

mock "tfplan/v2" {
	module {
		source = "./mocks/policy-failure-rds-cluster-literal-source-id-does-not-cover-all/mock-tfplan-v2.sentinel"
	}
}

mock "tfconfig/v2" {
	module {
		source = "./mocks/policy-failure-rds-cluster-literal-source-id-does-not-cover-all/mock-tfconfig-v2.sentinel"
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
