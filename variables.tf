variable "policy_configurations" {
  description = "A map of objects for PSC policy configurations."
  type = map(object({
    region        = string
    vpc_name      = string
    subnet_name   = string
    policy_name   = string
    service_class = string
    connection_limit = number
  }))
}