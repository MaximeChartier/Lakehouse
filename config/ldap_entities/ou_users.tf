resource "ldap_object" "ou_users" {
  dn             = "ou=users,dc=lakehouse,dc=home"
  object_classes = ["organizationalUnit"]
}