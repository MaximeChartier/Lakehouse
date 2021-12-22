terraform {
  required_providers {
    keycloak = {
      source = "mrparkers/keycloak"
      version = "3.6.0"
    }
  }
}

variable password {
  type        = string
  default     = "admin"
  description = "description"
}


provider "keycloak" {
    client_id     = "admin-cli"
    username      = "lakehouse_admin"
    password      =  "${var.password}"
    url           = "http://localhost:8443"
}