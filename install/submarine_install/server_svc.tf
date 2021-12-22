resource "kubernetes_service" "submarine_server" {
  metadata {
    name      = "submarine-server"
    namespace = "submarine-core"

    labels = {
      app = "submarine-server"
    }
  }

  spec {
    port {
      name = "http"
      port = 8080
    }

    selector = {
      app = "submarine-server"
    }
  }
}

