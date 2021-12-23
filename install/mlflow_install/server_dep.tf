resource "kubernetes_deployment" "mlflow_server" {
  metadata {
    name      = "mlflow-server"
    namespace = "mlflow"

    labels = {
      app = "mlflow-server"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mlflow-server"
      }
    }

    template {
      metadata {
        labels = {
          app = "mlflow-server"
        }
      }

      spec {
        container {
          name    = "server"
          image   = "apache/submarine:mlflow-0.6.0"
          command = ["/bin/bash", "-c", "mlflow server --host 0.0.0.0 --backend-store-uri $${BACKEND_URI} --default-artifact-root $${DEFAULT_ARTIFACT_ROOT}"]

          port {
            container_port = 5000
          }

          env {
            name  = "MLFLOW_S3_ENDPOINT_URL"
            value = "http://submarine-minio-service:9000"
          }

          env {
            name  = "AWS_ACCESS_KEY_ID"
            value = "submarine_minio"
          }

          env {
            name  = "AWS_SECRET_ACCESS_KEY"
            value = "submarine_minio"
          }

          env {
            name  = "BACKEND_URI"
            value = "mysql+pymysql://root:admin@mariadb.mariadb.svc.cluster.local:3306/mlflow_db"
          }

          env {
            name  = "DEFAULT_ARTIFACT_ROOT"
            value = "s3://mlflow"
          }

          image_pull_policy = "Always"
        }
      }
    }
  }
}

