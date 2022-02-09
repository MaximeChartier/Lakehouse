resource "ldap_object" "user_bob001" {
  dn             = "cn=bob001,${ldap_object.ou_users.dn}"
  object_classes = ["inetOrgPerson", "simpleSecurityObject"]
  attributes = [
    { sn = "LeServeur" },
    { givenName = "Bob" },
    { mail = "contact@veryloop.fr" },
    { userPassword = "bob001" }
  ]
}