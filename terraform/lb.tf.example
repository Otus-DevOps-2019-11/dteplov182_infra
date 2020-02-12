resource "google_compute_instance_group" "reddit-app-gr" {
  project     = var.project
  name        = "terraform-webservers"
  description = "Terraform test instance group"

  instances = google_compute_instance.app[*].self_link

  named_port {
    name = "http-9292"
    port = "9292"
  }

  zone = var.zone
}

module "gce-lb-http" {
  project     = var.project
  source      = "GoogleCloudPlatform/lb-http/google"
  name        = "group-http-lb"
  target_tags = [var.target_tags]
  backends = {
    default = {
      description                     = null
      protocol                        = "HTTP"
      port                            = 9292
      port_name                       = "http-9292"
      timeout_sec                     = 10
      connection_draining_timeout_sec = null
      enable_cdn                      = false

      health_check = {
        check_interval_sec  = 5
        timeout_sec         = 3
        healthy_threshold   = 1
        unhealthy_threshold = 3
        request_path        = "/"
        port                = 9292
        host                = null
      }

      groups = [
        {
          # Each node pool instance group should be added to the backend.
          group                        = "${google_compute_instance_group.reddit-app-gr.self_link}"
          balancing_mode               = null
          capacity_scaler              = null
          description                  = null
          max_connections              = null
          max_connections_per_instance = null
          max_connections_per_endpoint = null
          max_rate                     = null
          max_rate_per_instance        = null
          max_rate_per_endpoint        = null
          max_utilization              = null
        },
      ]
    }
  }
}
