resource "helm_release" "istio_base" {
  name        = "istio-base"
  repository  = "https://istio-release.storage.googleapis.com/charts"
  chart       = "base"
  version     = "1.12.0"
  timeout     = 120
  namespace   = "istio-system"
  wait             = true
  wait_for_jobs    = true
}

resource "helm_release" "istio_istiod" {
  name        = "istio-istiod"
  repository  = "https://istio-release.storage.googleapis.com/charts"
  chart       = "istiod"
  version     = "1.12.0"
  timeout     = 120
  namespace   = "istio-system"
  wait             = true
  wait_for_jobs    = true

  depends_on = [helm_release.istio_base]

  set {
    name  = "pilot.resources.requests.memory"
    value = "1024Mi"
  }
}

resource "helm_release" "istio_ingress" {
  name        = "istio-gateway"
  repository  = "https://istio-release.storage.googleapis.com/charts"
  chart       = "gateway"
  version     = "1.12.0"
  timeout     = 120
  namespace   = "istio-system"
  wait             = true
  wait_for_jobs    = true

  depends_on = [helm_release.istio_istiod]

  set {
    name  = "name"
    value = "istio-ingressgateway"
  }

  set {
    name  = "labels.app"
    value = "istio-ingressgateway"
  }
  
  set {
    name  = "labels.istio"
    value = "ingressgateway"
  }
}