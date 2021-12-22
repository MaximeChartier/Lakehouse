resource "helm_release" "keycloak" {
  name        = "keycloak"
  repository  = "https://charts.bitnami.com/bitnami"
  chart       = "keycloak"
  version     = "5.2.2"
  timeout     = 1000
  namespace   = "keycloak"

  values = [
    "${file("${path.module}/values.yaml")}"
  ]
}

output "password" {
  value = "admin"
}