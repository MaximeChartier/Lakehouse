resource "kubernetes_manifest" "sensor_argo_events_create_virutal_service_on_labpod" {
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind" = "Sensor"
    "metadata" = {
      "name" = "create-virutal-service-on-labpod"
      "namespace" = "argo-events"
    }
    "spec" = {
      "dependencies" = [
        {
          "eventName" = "example"
          "eventSourceName" = "resource"
          "name" = "test-dep"
        },
      ]
      "template" = {
        "serviceAccountName" = "argo-events-sa"
      }
      "triggers" = [
        {
          "parameters" = [
            {
              "dest" = "k8s.source.resource.spec.hosts.0"
              "operation" = "prepend"
              "src" = {
                "dataKey" = "body.metadata.annotations.hub\\.jupyter\\.org\\/username"
                "dependencyName" = "test-dep"
              }
            },
            {
              "dest" = "k8s.source.resource.metadata.name"
              "operation" = "append"
              "src" = {
                "dataKey" = "body.metadata.annotations.hub\\.jupyter\\.org\\/username"
                "dependencyName" = "test-dep"
              }
            },
            {
              "dest" = "k8s.source.resource.spec.http.0.route.0.destination.host"
              "operation" = "prepend"
              "src" = {
                "dataKey" = "body.metadata.annotations.hub\\.jupyter\\.org\\/username"
                "dependencyName" = "test-dep"
              }
            },
          ]
          "template" = {
            "k8s" = {
              "operation" = "create"
              "source" = {
                "resource" = {
                  "apiVersion" = "networking.istio.io/v1alpha3"
                  "kind" = "VirtualService"
                  "metadata" = {
                    "name" = "lab-vs-"
                    "namespace" = "jupyterhub"
                  }
                  "spec" = {
                    "gateways" = [
                      "istio-system/lakehouse-gateway",
                    ]
                    "hosts" = [
                      ".sparkui.lakehouse.home",
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
                              "host" = "-lab.jupyterhub.svc.cluster.local"
                              "port" = {
                                "number" = 4040
                              }
                            }
                          },
                        ]
                      },
                    ]
                  }
                }
              }
            }
            "name" = "argo-workflow"
          }
        },
      ]
    }
  }
}
