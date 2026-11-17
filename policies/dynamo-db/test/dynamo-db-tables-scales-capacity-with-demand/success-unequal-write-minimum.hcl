mock "tfplan/v2" {
  module {
    source = "./mocks/unequal-read-write-minimums/mock-tfplan-v2.sentinel"
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

param "min_target_read_utilization" {
  value = 80
}

param "min_target_write_utilization" {
  value = 20
}

test {
  rules = {
    main = true
  }
}
