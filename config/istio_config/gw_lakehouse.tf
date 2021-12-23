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
            "auth.lakehouse.home",
            "mlflow.lakehouse.home",
            "jupyterhub.lakehouse.home",
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