resource "ldap_object" "user_max001" {
  dn             = "cn=max001,${ldap_object.ou_users.dn}"
  object_classes = ["inetOrgPerson", "simpleSecurityObject"]
  attributes = [
    { sn = "Chartier" },
    { givenName = "Maxime" },
    { mail = "contact@veryloop.fr" },
    { userPassword = "max001" }
  ]
}