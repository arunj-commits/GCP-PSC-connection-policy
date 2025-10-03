policy_configurations = {
  psc-policy-cloud-sql-dev = {
    region          = "us-central1"
    vpc_name        = "psc2"
    subnet_name     = "psc2"
    policy_name     = "psc-policy-cloud-sql-dev"
    service_class   = "google-cloud-sql"
    connection_limit = 3
  }
    psc-policy-cloud-sql-prod = {
    region          = "us-central1"
    vpc_name        = "psc3"
    subnet_name     = "psc3"
    policy_name     = "psc-policy-cloud-sql-prod"
    service_class   = "google-cloud-sql"
    connection_limit = 2
  }
}