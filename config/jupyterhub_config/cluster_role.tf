resource "kubernetes_cluster_role" "argo_events_role" {
  metadata {
    name = "argo-events-role"
  }

  rule {
    verbs      = ["create", "delete", "deletecollection", "get", "list", "patch", "update", "watch"]
    api_groups = ["networking.istio.io"]
    resources  = ["virtualservices"]
  }

  rule {
    verbs      = ["create", "delete", "deletecollection", "get", "list", "patch", "update", "watch"]
    api_groups = ["argoproj.io"]
    resources  = ["sensors", "sensors/finalizers", "sensors/status", "eventsources", "eventsources/finalizers", "eventsources/status", "eventbus", "eventbus/finalizers", "eventbus/status"]
  }

  rule {
    verbs      = ["create", "get", "list", "watch", "update", "patch", "delete"]
    api_groups = [""]
    resources  = ["pods", "pods/exec", "configmaps", "secrets", "services", "persistentvolumeclaims"]
  }

  rule {
    verbs      = ["create", "get", "list", "watch", "update", "patch", "delete"]
    api_groups = ["apps"]
    resources  = ["deployments", "statefulsets"]
  }
}

