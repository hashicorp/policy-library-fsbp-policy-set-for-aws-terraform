mock "tfconfig/v2" {
  module { source = "./mocks/policy-failure-second-public-zone-without-query-log/mock-tfconfig-v2.sentinel" }
}
mock "tfresources" {
  module { source = "../../../../modules/tfresources/tfresources.sentinel" }
}
mock "report" {
  module { source = "../../../../modules/mocks/report/report.sentinel" }
}
test {
  rules = { main = false }
}
