terraform {
  required_providers {
    ldap = {
      source = "elastic-infra/ldap"
      version = "2.0.0"
    }
  }
}

variable password {
  type        = string
  default     = "admin"
  description = "description"
}

provider "ldap" {
  ldap_host     = "localhost"
  ldap_port     = 8389
  bind_user     = "cn=admin,dc=lakehouse,dc=home"
  bind_password = "${var.password}"
}
