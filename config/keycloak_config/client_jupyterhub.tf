resource "keycloak_openid_client" "openid_client_jupyterhub" {
  realm_id            = keycloak_realm.lakehouse.id
  client_id           = "jupyterhub"

  name                = "JupyterHub"
  enabled             = true

  access_type         = "PUBLIC"
  valid_redirect_uris = [
    "http://jupyterhub.lakehouse.home/hub/oauth_callback"
  ]

  standard_flow_enabled = true
}