resource "kubernetes_namespace" "logstash" {
  metadata {
    name = "logstash"
    annotations = {}
    labels = {
      istio-injection = "enabled"
    }
  }
}