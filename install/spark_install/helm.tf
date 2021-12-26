resource "helm_release" "spark" {
  name        = "spark"
  repository  = "https://charts.bitnami.com/bitnami"
  chart       = "spark"
  version     = "5.7.13"
  timeout     = 1000
  namespace   = "jupyterhub"

  values = [
    "${file("${path.module}/values.yaml")}"
  ]
}