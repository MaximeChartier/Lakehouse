resource "kubernetes_manifest" "virtualservice_mlflow" {
  manifest = {
    "apiVersion" = "networking.istio.io/v1alpha3"
    "kind" = "VirtualService"
    "metadata" = {
      "name" = "mlflow"
      "namespace" = "mlflow"
    }
    "spec" = {
      "gateways" = [
        "istio-system/lakehouse-gateway",
      ]
      "hosts" = [
        "mlflow.lakehouse.home",
      ]
      "http" = [
        {
          "match" = [
            {
              "uri" = {
                "prefix" = "/"
              }
            },
          ]
          "route" = [
            {
              "destination" = {
                "host" = "mlflow-server.mlflow.svc.cluster.local"
                "port" = {
                  "number" = 5000
                }
              }
            },
          ]
        },
      ]
    }
  }
}
