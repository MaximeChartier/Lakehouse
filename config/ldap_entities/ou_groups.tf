resource "ldap_object" "ou_groups" {
  dn             = "ou=groups,dc=lakehouse,dc=home"
  object_classes = ["organizationalUnit"]
}