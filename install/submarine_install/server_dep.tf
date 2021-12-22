resource "kubernetes_deployment" "submarine_server" {
  metadata {
    name      = "submarine-server"
    namespace = "submarine-core"

    labels = {
      app = "submarine-server"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "submarine-server"
      }
    }

    template {
      metadata {
        labels = {
          app = "submarine-server"
        }
      }

      spec {
        container {
          name  = "server"
          image = "apache/submarine:server-0.6.0"

          port {
            container_port = 8080
          }

          image_pull_policy = "Always"
        }
      }
    }
  }
}

