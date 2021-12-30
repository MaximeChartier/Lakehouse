terraform {
  backend "local" {}
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
  depends_on = [module.istio_install]
}

module "keycloak_install" {
  source = "./keycloak_install"
  depends_on = [module.ldap_install]
}

module "mariadb_install" {
  source = "./mariadb_install"
  depends_on = [module.istio_install]
}

module "mlflow_install" {
  source = "./mlflow_install"
  depends_on = [module.mariadb_install]
}

module "jupyterhub_install" {
  source = "./jupyterhub_install"
  depends_on = [module.mariadb_install]
}

module "spark_install" {
  source = "./spark_install"
  depends_on = [module.istio_install]
}

module "argo_events_install" {
  source = "./argo_events_install"
  depends_on = [module.istio_install]
}

module "minio_install" {
  source = "./minio_install"
  depends_on = [module.istio_install]
}

module "kafka_install" {
  source = "./kafka_install"
  depends_on = [module.istio_install]
}

module "logstash_install" {
  source = "./logstash_install"
  depends_on = [module.istio_install]
}