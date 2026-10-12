resource "kubernetes_deployment_v1" "web" {
  metadata {
    name   = "web"
    labels = { app = "web" }
  }

  spec {
    replicas = 2

    selector {
      match_labels = { app = "web" }
    }

    template {
      metadata {
        labels = { app = "web" }
      }

      spec {
        container {
          name              = "web"
          image             = "week-4-web:latest"
          image_pull_policy = "Never"

          port {
            container_port = 5000
          }

          env_from {
            config_map_ref {
              name = kubernetes_config_map_v1.app_config.metadata[0].name
            }
          }

          env_from {
            secret_ref {
              name = kubernetes_secret_v1.app_secrets.metadata[0].name
            }
          }

          env {
            name  = "DB_HOST"
            value = "db"
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "web" {
  metadata {
    name = "web"
  }

  spec {
    selector = { app = "web" }

    port {
      port        = 8080
      target_port = 5000
    }

    type = "ClusterIP"
  }
}
