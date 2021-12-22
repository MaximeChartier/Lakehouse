resource "helm_release" "mariadb" {
  name        = "mariadb"
  repository  = "https://charts.bitnami.com/bitnami"
  chart       = "mariadb"
  version     = "10.1.1"
  timeout     = 1000
  namespace   = "mariadb"

  values = [
    "${file("${path.module}/values.yaml")}"
  ]
}