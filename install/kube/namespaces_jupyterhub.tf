resource "kubernetes_namespace" "jupyterhub" {
  metadata {
    name = "jupyterhub"
    annotations = {}
    labels = {
      istio-injection = "enabled"
    }
  }
}