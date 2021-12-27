resource "helm_release" "argo-events" {
  name        = "argoevents"
  repository  = "https://argoproj.github.io/argo-helm"
  chart       = "argo-events"
  version     = "1.8.0"
  timeout     = 1000
  namespace   = "argo-events"

  values = [
    "${file("${path.module}/values.yaml")}"
  ]
}