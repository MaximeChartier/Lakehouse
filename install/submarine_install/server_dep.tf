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
        volume {
          name = "config"

          config_map {
            name = "submarine-server-config"
          }
        }

        container {
          name  = "server"
          image = "apache/submarine:server-0.6.0"

          port {
            container_port = 8080
          }

          env {
            name  = "SUBMARINE_SERVER_PORT"
            value = "8080"
          }

          volume_mount {
            name       = "config"
            read_only  = true
            mount_path = "/opt/submarine-current/conf/submarine-site.xml"
            sub_path   = "submarine-site.xml"
          }

          image_pull_policy = "Always"
        }
      }
    }
  }
}

