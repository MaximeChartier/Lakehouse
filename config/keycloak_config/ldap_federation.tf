resource "keycloak_ldap_user_federation" "ldap_user_federation" {
  name     = "openldap"
  realm_id = keycloak_realm.lakehouse.id
  enabled  = true

  username_ldap_attribute = "cn"
  rdn_ldap_attribute      = "cn"
  uuid_ldap_attribute     = "entryDN"
  user_object_classes     = [
    "simpleSecurityObject",
    "inetOrgPerson"
  ]
  connection_url          = "ldap://openldap-openldap-stack-ha.ldap.svc.cluster.local"
  users_dn                = "ou=users,dc=lakehouse,dc=home"
  bind_dn                 = "cn=admin,dc=lakehouse,dc=home"
  bind_credential         = "admin"

  connection_timeout = "5s"
  read_timeout       = "10s"

  #kerberos {
  #  kerberos_realm   = "FOO.LOCAL"
  #  server_principal = "HTTP/host.foo.com@FOO.LOCAL"
  #  key_tab          = "/etc/host.keytab"
  #}
}