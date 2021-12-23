resource "kubernetes_service" "mlflow_server" {
  metadata {
    name      = "mlflow-server"
    namespace = "mlflow"

    labels = {
      app = "mlflow-server"
    }
  }

  spec {
    port {
      name = "http"
      port = 5000
    }

    selector = {
      app = "mlflow-server"
    }
  }
}

