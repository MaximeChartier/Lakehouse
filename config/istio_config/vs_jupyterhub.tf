resource "kubernetes_manifest" "virtualservice_jupyterhub" {
  manifest = {
    "apiVersion" = "networking.istio.io/v1alpha3"
    "kind" = "VirtualService"
    "metadata" = {
      "name" = "jupyterhub"
      "namespace" = "jupyterhub"
    }
    "spec" = {
      "gateways" = [
        "istio-system/lakehouse-gateway",
      ]
      "hosts" = [
        "jupyterhub.lakehouse.home",
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
                "host" = "jupyterhub-proxy-public.jupyterhub.svc.cluster.local"
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
