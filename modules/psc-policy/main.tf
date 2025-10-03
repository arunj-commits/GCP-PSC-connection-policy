resource "google_network_connectivity_service_connection_policy" "psc_policy" {
  name          = var.policy_name
  network       = var.network_self_link
  location      = var.region
  service_class = var.service_class
  

  # psc_config block configures the subnetwork for PSC endpoint allocation.
  psc_config {
    subnetworks = [var.subnetwork_self_link]
    limit       = var.connection_limit
  }
}