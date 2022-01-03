resource "kubernetes_config_map" "dns_config" {
  metadata {
    name      = "dns-config"
    namespace = "jupyterhub"
  }

  data = {
    Corefile = ".:53 {\n  errors\n  log\n  rewrite name auth.lakehouse.home keycloak.keycloak.svc.cluster.local\n  forward . /etc/resolv.conf\n  cache 5\n  reload\n}\n"

    "resolv.conf" = "search jupyterhub.svc.cluster.local svc.cluster.local cluster.local\nnameserver 127.0.01\noptions ndots:5\n"
  }
}