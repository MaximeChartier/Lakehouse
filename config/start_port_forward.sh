#!/bin/bash

exec 1<&-
exec 2<&-

kubectl port-forward service/openldap-openldap-stack-ha -n ldap 8389:389 > /dev/null &
echo $! > pid_ldap.bak
kubectl port-forward service/mariadb -n mariadb 3306:3306 > /dev/null &
echo $! > pid_mariadb.bak
kubectl port-forward service/keycloak -n keycloak 8443:80 > /dev/null &
echo $! > pid_keycloak.bak

sleep 1

exit 0