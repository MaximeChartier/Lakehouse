resource "kubernetes_manifest" "virtualservice_spark" {
  manifest = {
    "apiVersion" = "networking.istio.io/v1alpha3"
    "kind" = "VirtualService"
    "metadata" = {
      "name" = "spark"
      "namespace" = "spark"
    }
    "spec" = {
      "gateways" = [
        "istio-system/lakehouse-gateway",
      ]
      "hosts" = [
        "spark.lakehouse.home",
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
                "host" = "spark-master-svc.spark.svc.cluster.local"
                "port" = {
                  "number" = 80
                }
              }
            },
          ]
        },
      ]
    }
  }
}
