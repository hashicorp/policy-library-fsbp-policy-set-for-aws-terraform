mock "tfplan/v2" {
  module { source = "./mocks/policy-arbitrary-tls-attribute/mock-tfplan-v2.sentinel" }
}
mock "tfconfig/v2" {
  module { source = "./mocks/policy-arbitrary-tls-attribute/mock-tfconfig-v2.sentinel" }
}
mock "tfresources" {
  module { source = "../../../../modules/tfresources/tfresources.sentinel" }
}
mock "report" {
  module { source = "../../../../modules/mocks/report/report.sentinel" }
}
test { rules = { main = false } }
