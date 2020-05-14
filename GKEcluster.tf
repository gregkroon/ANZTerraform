variable "region" {
    type = string
    }

variable "credentials" {
    type = string
    }

variable "project" {
    type = string
    }

variable "name" {
    type = string
    }

variable "location" {
    type = string
    }

variable "initial_node_count" {
    type = string
    }



provider "google" {
    
    project = var.project
    credentials = var.credentials
    region = var.region
    
}

resource "google_container_cluster" "primary" {
  name = var.name
  location = var.location
  initial_node_count = var.initial_node_count

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

output "namespace" {
    value = "default"
    }

output "gcp_cluster_name"{
    
    value = "asia-southeast1-a/anzcluster"
    }

output "fqn" {
    
    value = "asia-southeast1-a/anzcluster"
    }
