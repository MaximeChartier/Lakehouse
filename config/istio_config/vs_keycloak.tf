resource "kubernetes_manifest" "virtualservice_keycloak_keycloak" {
  manifest = {
    "apiVersion" = "networking.istio.io/v1alpha3"
    "kind" = "VirtualService"
    "metadata" = {
      "name" = "keycloak"
      "namespace" = "keycloak"
    }
    "spec" = {
      "gateways" = [
        "istio-system/lakehouse-gateway",
      ]
      "hosts" = [
        "auth.lakehouse.home",
      ]
      "http" = [
        {
          "match" = [
            {
              "uri" = {
                "exact" = "/"
              }
            },
            {
              "uri" = {
                "exact" = "/auth/"
              }
            },
            {
              "uri" = {
                "prefix" = "/auth/realms/master/"
              }
            },
          ]
          "redirect" = {
            "uri" = "/auth/realms/lakehouse/"
          }
        },
        {
          "match" = [
            {
              "uri" = {
                "prefix" = "/"
              }
            },
          ]
          "rewrite" = {
            "uri" = "/"
          }
          "route" = [
            {
              "destination" = {
                "host" = "keycloak.keycloak.svc.cluster.local"
                "port" = {
                  "number" = 80
                }
              }
              "headers" = {
                "request" = {
                  "add" = {
                    "X-Forwarded-Proto" = "https"
                  }
                }
              }
            },
          ]
        },
      ]
    }
  }
}
