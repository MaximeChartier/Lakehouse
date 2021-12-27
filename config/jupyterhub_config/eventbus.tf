resource "kubernetes_manifest" "eventbus_argo_events_default" {
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind" = "EventBus"
    "metadata" = {
      "name" = "default"
      "namespace" = "argo-events"
    }
    "spec" = {
      "nats" = {
        "native" = {}
      }
    }
  }
}
