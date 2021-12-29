resource "kubernetes_manifest" "virtualservice_minio" {
  manifest = {
    "apiVersion" = "networking.istio.io/v1alpha3"
    "kind" = "VirtualService"
    "metadata" = {
      "name" = "minio"
      "namespace" = "minio"
    }
    "spec" = {
      "gateways" = [
        "istio-system/lakehouse-gateway",
      ]
      "hosts" = [
        "minio.lakehouse.home",
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
                "host" = "minio.minio.svc.cluster.local"
                "port" = {
                  "number" = 9001
                }
              }
            },
          ]
        },
      ]
    }
  }
}
