provider "google" {
  credentials = "${file("FlugelTest-444a4376f135.json")}"
  project     = "flugeltest"
  zone = "us-central1-a"
}

resource "google_container_cluster" "primary" {
  name = "hello"
  zone = "us-central1-a"
  initial_node_count = 1
  enable_legacy_abac = true
  project = "flugeltest"

  additional_zones = [
    "us-central1-b",
    "us-central1-c",
  ]

  master_auth {
    username = "flugelAdmin"
    password = "444a4376f135329ed0abf2677915ba57e5d05f76"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels {
      foo = "bar"
    }

    tags = ["foo", "bar"]
  }
}
# The following outputs allow authentication and connectivity to the GKE Cluster.
output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}

provider "kubernetes" {
  version          = "~> 1.3"
 
  host  = "${google_container_cluster.primary.endpoint}"
  config_context_cluster   = "hello"
  client_certificate     = "${base64decode(google_container_cluster.primary.master_auth.0.client_certificate)}"
  client_key             = "${base64decode(google_container_cluster.primary.master_auth.0.client_key)}"
  cluster_ca_certificate = "${base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)}"
  load_config_file = false
}

resource "kubernetes_pod" "sh-deployment" {
  metadata{
    name = "sh-deployment"
    labels {
      App = "sh-deployment"
    }
      
  }
  
  spec {
    container {
      name = "sh-deployment"
      image = "rafaelhdr/server-hello"
    }
    restart_policy = "OnFailure"
  }
}

resource "kubernetes_service" "sh-service-lb" {
  metadata { name = "sh-service"}
  spec{
    selector {
      # app = "${kubernetes_pod.sh-deployment.metadata.0.labels.app}"
      App = "${kubernetes_pod.sh-deployment.metadata.0.labels.App}"
    }

    port {
      port = 80
      target_port = 5000
    } 
    
    type = "LoadBalancer"
  }
}

