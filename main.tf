provider "google" {
  project = "xxxxxx" # Replace with your GCP Project ID
  region  = "us-east1"        # Specify your desired default region
  credentials = file("xxxxxx.json")
  zone    = "us-east1-c"      # Specify your desired default zone (optional)
 }

data "google_project" "current" {}

#Enable Network Connectivity API

# Use for_each to create multiple instances of the psc-policy module.
module "psc_setup" {
  for_each = var.policy_configurations
  source   = "./modules/psc-policy"
  
  # Pass other required variables from the map defined in `terraform.tfvars`.
  region        = each.value.region
  policy_name   = each.value.policy_name
  service_class = each.value.service_class
  connection_limit = each.value.connection_limit

   # Construct the self-links using the project ID and the resource names from the loop

  network_self_link = "projects/${data.google_project.current.project_id}/global/networks/${each.value.vpc_name}"
  subnetwork_self_link = "projects/${data.google_project.current.project_id}/regions/${each.value.region}/subnetworks/${each.value.subnet_name}"
 
}



#Cloud Resource Manager API -Enable

# --- Import block ---
#import {
#  to = module.psc_setup["test2"].google_network_connectivity_service_connection_policy.psc_policy
#  id = "projects/psc-endpoint-473916/locations/us-east4/serviceConnectionPolicies/test2"
#}

