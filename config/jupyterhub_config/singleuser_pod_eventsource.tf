resource "kubernetes_manifest" "eventsource_argo_events_resource" {
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind" = "EventSource"
    "metadata" = {
      "name" = "resource"
      "namespace" = "argo-events"
    }
    "spec" = {
      "resource" = {
        "example" = {
          "eventTypes" = [
            "ADD",
          ]
          "filter" = {
            "afterStart" = true
            "labels" = [
              {
                "key" = "component"
                "operation" = "=="
                "value" = "singleuser-server"
              },
            ]
          }
          "group" = ""
          "namespace" = "jupyterhub"
          "resource" = "pods"
          "version" = "v1"
        }
      }
      "template" = {
        "serviceAccountName" = "argo-events-sa"
      }
    }
  }
}
