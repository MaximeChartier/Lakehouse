resource "helm_release" "openldap" {
  name        = "openldap"
  repository  = "https://jp-gouin.github.io/helm-openldap"
  chart       = "openldap-stack-ha"
  version     = "2.1.6"
  timeout     = 1000
  namespace   = "ldap"
  
  values = [
    "${file("${path.module}/values.yaml")}"
  ]
}

output "password" {
  value = "admin"
}