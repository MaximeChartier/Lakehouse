resource "kubernetes_namespace" "spark" {
  metadata {
    name = "spark"
    annotations = {}
    labels = {
      istio-injection = "enabled"
    }
  }
}