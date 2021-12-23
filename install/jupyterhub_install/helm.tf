resource "helm_release" "jupyterhub" {
  name        = "jupyterhub"
  repository  = "https://charts.bitnami.com/bitnami"
  chart       = "jupyterhub"
  version     = "0.3.6"
  timeout     = 1000
  namespace   = "jupyterhub"

  values = [
    "${file("${path.module}/values.yaml")}"
  ]
}