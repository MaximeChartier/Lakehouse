resource "kubernetes_job" "submarine_databases_init_metastore" {
  metadata {
    name      = "submarine-databases-init-metastore"
    namespace = "default"
  }

  spec {
    backoff_limit = 1

    template {
      metadata {}

      spec {
        container {
          name    = "submarine-initdb"
          image   = "apache/submarine:database-0.6.0"
          command = ["mysql", "-uroot", "-padmin", "-hmariadb.mariadb.svc.cluster.local", "submarine_metastore_db", "-esource /tmp/database/metastore.sql;"]
        }

        restart_policy = "Never"
      }
    }

    ttl_seconds_after_finished = 10
  }
}

resource "kubernetes_job" "submarine_databases_init_server" {
  metadata {
    name      = "submarine-databases-init-server"
    namespace = "default"
  }

  spec {
    backoff_limit = 1

    template {
      metadata {}

      spec {
        container {
          name    = "submarine-initdb"
          image   = "apache/submarine:database-0.6.0"
          command = ["mysql", "-uroot", "-padmin", "-hmariadb.mariadb.svc.cluster.local", "submarine_server_db", "-esource /tmp/database/submarine.sql; source /tmp/database/submarine-model.sql; source /tmp/database/submarine-data.sql;"]
        }

        restart_policy = "Never"
      }
    }

    ttl_seconds_after_finished = 10
  }
}

