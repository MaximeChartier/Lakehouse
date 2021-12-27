terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.4.1"
    }
  }
}

# sudo -E kubectl port-forward service/keycloak -n keycloak 8443:80
# sudo -E kubectl port-forward service/openldap-openldap-stack-ha -n ldap 389:389
# sudo -E kubectl port-forward service/mariadb -n mariadb 3306:3306

provider "kubernetes" {
  config_path    = "~/.kube/config"
}

module "istio_config" {
  source = "./istio_config"
}

module "ldap_entities" {
  source = "./ldap_entities"
  password = "admin"
}

module "keycloak_config" {
  source = "./keycloak_config"
  password = "admin"
}

module "mariadb_config" {
  source = "./mariadb_config"
}

module "jupyterhub_config" {
  source = "./jupyterhub_config"
}