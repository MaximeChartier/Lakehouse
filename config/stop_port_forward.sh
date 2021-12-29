#!/bin/bash

kill -9 `cat pid_ldap.bak`
rm pid_ldap.bak
kill -9 `cat pid_keycloak.bak`
rm pid_keycloak.bak
kill -9 `cat pid_mariadb.bak`
rm pid_mariadb.bak
kill -9 `cat pid_minio.bak`
rm pid_minio.bak

exit 0