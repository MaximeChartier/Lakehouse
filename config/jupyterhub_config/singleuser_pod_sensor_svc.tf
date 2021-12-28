resource "kubernetes_manifest" "sensor_argo_events_create_service_on_labpod" {
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind" = "Sensor"
    "metadata" = {
      "name" = "create-service-on-labpod"
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
              "dest" = "k8s.source.resource.spec.selector.hub\\.jupyter\\.org\\/username"
              "src" = {
                "dataKey" = "body.metadata.annotations.hub\\.jupyter\\.org\\/username"
                "dependencyName" = "test-dep"
              }
            },
            {
              "dest" = "k8s.source.resource.metadata.name"
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
                  "apiVersion" = "v1"
                  "kind" = "Service"
                  "metadata" = {
                    "name" = "-lab"
                    "namespace" = "jupyterhub"
                  }
                  "spec" = {
                    "ports" = [
                      {
                        "name" = "http-sparkui"
                        "port" = 4040
                      },
                      {
                        "name" = "tcp-blockmanager"
                        "port" = 6060
                      },
                      {
                        "name" = "tcp-driver"
                        "port" = 2020
                      },
                    ]
                    "selector" = {
                      "hub.jupyter.org/username" = "default"
                    }
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
