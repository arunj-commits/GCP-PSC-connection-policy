# variable "network_self_link"
# The self_link of the existing VPC network where the policy will be applied.
variable "network_self_link" {
  description = "The self_link of the existing VPC network."
  type        = string
}

# variable "subnetwork_self_link"
# The self_link of the existing subnetwork to be used for PSC endpoints.
variable "subnetwork_self_link" {
  description = "The self_link of the existing subnetwork for the PSC endpoints."
  type        = string
}

# variable "region"
# The region where the resources are being created.
variable "region" {
  description = "The region where the resources are created."
  type        = string
}

# variable "policy_name"
# The desired name for the PSC service connection policy.
variable "policy_name" {
  description = "The name of the PSC service connection policy."
  type        = string
}

variable "service_class" {
  description = "The service class for the PSC policy."
  type        = string
}

variable "connection_limit" {
  description = "Max number of PSC connections for this policy. If null, there is no limit."
  type        = number
  default     = null
}