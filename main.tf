provider "google" {
  project = "xxxxxx" # Replace with your GCP Project ID
  region  = "us-east1"        # Specify your desired default region
  credentials = file("xxxxx.json")  Replace with your key
  zone    = "us-east1-c"      # Specify your desired default zone (optional)
 }

data "google_compute_network" "existing_vpc" {
  for_each = var.policy_configurations
  name     = each.value.vpc_name
}

# Loop through the policy configurations to fetch each existing subnet.
data "google_compute_subnetwork" "existing_subnet" {
  for_each = var.policy_configurations
  name     = each.value.subnet_name
  region   = each.value.region
}

# --- Looping to create multiple PSC policies and resources ---

# Use for_each to create multiple instances of the psc-policy module.
module "psc_setup" {
  for_each = var.policy_configurations
  source   = "./modules/psc-policy"

  # Use the data sources with each.key to pass the correct network links.
  network_self_link    = data.google_compute_network.existing_vpc[each.key].self_link
  subnetwork_self_link = data.google_compute_subnetwork.existing_subnet[each.key].self_link

  # Pass other required variables from the map defined in `terraform.tfvars`.
  region        = each.value.region
  policy_name   = each.value.policy_name
  service_class = each.value.service_class
  connection_limit = each.value.connection_limit
}