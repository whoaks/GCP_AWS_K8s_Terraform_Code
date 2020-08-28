provider "google" {
    credentials = file(var.gcp_credentials)
    project     = var.gcp_project_id
    region      = var.gcp_region
}

// VPC Creation 

resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = var.gcp_auto_create_subnetwork
  routing_mode            = var.gcp_routing_mode
}

// Subnet in Custom VPC

resource "google_compute_subnetwork" "subnet" {
  network       = google_compute_network.vpc_network.id
  name          = var.gcp_subnet_name
  ip_cidr_range = var.gcp_subnet_cidr
  region        = var.gcp_region
}

// Firewall

resource "google_compute_firewall" "firewall" {
  name          = var.gcp_firewall_name
  network       = google_compute_network.vpc_network.name
  source_ranges = [ var.allow_all ]
  allow {
    protocol = var.gcp_protocol
  }
}

resource "google_container_cluster" "gce" {
  name                     = var.cluster_name
  location                 = var.gcp_region
  remove_default_node_pool = var.gcp_remove_default_node_pool
  initial_node_count       = var.gcp_initial_node_count

  network    = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.subnet.name

}

resource "google_container_node_pool" "node_pool" {
  location   = var.gcp_region
  name       = var.gcp_container_node_pool_name
  cluster    = google_container_cluster.gce.name
  node_count = var.gcp_node_count

  node_config {
    machine_type = var.gcp_container_machine_type
  }
}

data "google_client_config" "provider" {}

data "google_container_cluster" "gce" {
  name     = var.cluster_name
  location = var.gcp_region
}

  provider "kubernetes" {  

  load_config_file = false

  host                   = "https://${data.google_container_cluster.gce.endpoint}"
  token                  = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
  data.google_container_cluster.gce.master_auth[0].cluster_ca_certificate,
  )
}

resource "kubernetes_pod" "wppod" {
  metadata {
    name   = var.pod_name
    labels = {
      dc = var.pod_labels[0]
      app = var.pod_labels[1]
    }
  }

  spec {
    container {
      image = var.image_name
      name  = var.container_name
    }
  }
  
}


resource "kubernetes_service" "wplb" {
  metadata {
    name = var.loadbalancer_name
  }
  spec {
    selector = {
      app    = var.pod_labels[1]
    }
    port {
      port        = 80
      target_port = 80
    }

    type = var.pod_expose_type
  }
}



output "loadbalancer_IP_Address" {
  value = "${kubernetes_service.wplb.load_balancer_ingress.0.ip}"
}

