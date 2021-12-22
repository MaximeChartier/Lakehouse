resource "kubernetes_manifest" "virtualservice_submarine_core_submarine" {
  manifest = {
    "apiVersion" = "networking.istio.io/v1alpha3"
    "kind" = "VirtualService"
    "metadata" = {
      "name" = "submarine"
      "namespace" = "submarine-core"
    }
    "spec" = {
      "gateways" = [
        "istio-system/lakehouse-gateway",
      ]
      "hosts" = [
        "subadmin.lakehouse.home",
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
                "host" = "submarine-server.submarine-core.svc.cluster.local"
                "port" = {
                  "number" = 8080
                }
              }
            },
          ]
        },
      ]
    }
  }
}
