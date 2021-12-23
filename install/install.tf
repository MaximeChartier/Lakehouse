terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.4.1"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "kube" {
  source = "./kube"
}

module "istio_install" {
  source = "./istio_install"
  depends_on = [module.kube]
}

module "ldap_install" {
  source = "./ldap_install"
  depends_on = [module.kube]
}

module "keycloak_install" {
  source = "./keycloak_install"
  depends_on = [module.kube]
}

module "mariadb_install" {
  source = "./mariadb_install"
  depends_on = [module.kube]
}

module "mlflow_install" {
  source = "./mlflow_install"
  depends_on = [module.kube]
}

module "jupyterhub_install" {
  source = "./jupyterhub_install"
  depends_on = [module.kube]
}