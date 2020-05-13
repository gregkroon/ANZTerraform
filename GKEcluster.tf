variable "region" {
    region = var.region 
    }

variable "credentials" {
    credentials = var.credentials 
    }

variable "project" {
    project = var.project 
    }

variable "name" {
    name = var.name
    }

variable "location" {
    location = var.location
    }

variable "initial_node_count" {
    initial_node_count = var.initial_node_count
    }



provider "google" {
}

resource "google_container_cluster" "primary" {
  #name               = "harnessterraform"
  #location           = "asia-southeast1-a"
  #initial_node_count = 1

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
