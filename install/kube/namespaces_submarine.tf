#resource "kubernetes_namespace" "submarine_core" {
#  metadata {
#    name = "submarine-core"
#    annotations = {}
#    labels = {
#      istio-injection = "enabled"
#    }
#  }
#}