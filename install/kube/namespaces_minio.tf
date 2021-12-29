resource "kubernetes_namespace" "minio" {
  metadata {
    name = "minio"
    annotations = {}
    labels = {
      istio-injection = "enabled"
    }
  }
}