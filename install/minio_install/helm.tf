resource "helm_release" "minio" {
  name        = "minio"
  repository  = "https://charts.bitnami.com/bitnami"
  chart       = "minio"
  version     = "9.2.8"
  timeout     = 1000
  namespace   = "minio"

  values = [
    "${file("${path.module}/values.yaml")}"
  ]
}