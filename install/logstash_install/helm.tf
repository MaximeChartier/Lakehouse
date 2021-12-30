resource "helm_release" "logstash" {
  name        = "logstash"
  repository  = "https://charts.bitnami.com/bitnami"
  chart       = "logstash"
  version     = "3.6.22"
  timeout     = 1000
  namespace   = "logstash"

  values = [
    "${file("${path.module}/values.yaml")}"
  ]
}