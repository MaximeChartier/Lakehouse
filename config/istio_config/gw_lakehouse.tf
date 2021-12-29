resource "kubernetes_manifest" "gateway_istio_system_lakehouse_gateway" {
  manifest = {
    "apiVersion" = "networking.istio.io/v1beta1"
    "kind" = "Gateway"
    "metadata" = {
      "name" = "lakehouse-gateway"
      "namespace" = "istio-system"
    }
    "spec" = {
      "selector" = {
        "istio" = "ingressgateway"
      }
      "servers" = [
        {
          "hosts" = [
            "lakehouse.home",
            "spark.lakehouse.home",
            "auth.lakehouse.home",
            "jupyterhub.lakehouse.home",
            "mlflow.lakehouse.home",
            "minio.lakehouse.home",
            "*.sparkui.lakehouse.home",
          ]
          "port" = {
            "name" = "http"
            "number" = 80
            "protocol" = "HTTP"
          }
        },
      ]
    }
  }
}