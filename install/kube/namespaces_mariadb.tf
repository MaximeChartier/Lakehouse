resource "kubernetes_namespace" "mariadb" {
  metadata {
    name = "mariadb"
    annotations = {}
    labels = {
      istio-injection = "enabled"
    }
  }
}