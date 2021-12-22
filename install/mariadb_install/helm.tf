resource "helm_release" "keycloak" {
  name        = "mariadb"
  repository  = "https://charts.bitnami.com/bitnami"
  chart       = "mariadb"
  version     = "10.1.1"
  timeout     = 1000
  namespace   = "mariadb"
}