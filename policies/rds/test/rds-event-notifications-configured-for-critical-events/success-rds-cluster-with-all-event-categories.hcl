# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1

mock "tfplan/v2" {
	module {
		source = "./mocks/policy-success-rds-cluster-with-all-event-categories/mock-tfplan-v2.sentinel"
	}
}

mock "tfconfig/v2" {
	module {
		source = "./mocks/policy-success-rds-cluster-with-all-event-categories/mock-tfconfig-v2.sentinel"
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
