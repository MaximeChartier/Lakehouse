resource "kubernetes_namespace" "mlflow" {
  metadata {
    name = "mlflow"
    annotations = {}
    labels = {
      istio-injection = "enabled"
    }
  }
}