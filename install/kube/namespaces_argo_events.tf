resource "kubernetes_namespace" "argo-events" {
  metadata {
    name = "argo-events"
    annotations = {}
    labels = {
      istio-injection = "enabled"
    }
  }
}