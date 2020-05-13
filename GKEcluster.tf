provider "google" {
  credentials = "/Users/gregorykroon/Downloads/anzbank-fa4ce11ca2b5.json"
  project     = "anzbank"
  region      = "asia-southeast1-a"
}

resource "google_container_cluster" "primary" {
  name               = "harnessterraform"
  location           = "asia-southeast1-a"
  initial_node_count = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }

    labels = {
      foo = "bar"
    }

    tags = ["foo", "bar"]
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}
