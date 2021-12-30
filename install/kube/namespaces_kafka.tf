resource "kubernetes_namespace" "kafka" {
  metadata {
    name = "kafka"
    annotations = {}
    labels = {
      istio-injection = "enabled"
    }
  }
}