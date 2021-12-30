resource "helm_release" "kafka" {
  name        = "kafka"
  repository  = "https://charts.bitnami.com/bitnami"
  chart       = "kafka"
  version     = "14.8.1"
  timeout     = 1000
  namespace   = "kafka"

  values = [
    "${file("${path.module}/values.yaml")}"
  ]
}