# Documentation

## Installer un cluster Kubernetes de test en local 

**Méthode 1**

Utiliser Minikube (pas testé)

**Méthode 2**

Suivre ce [tuto](kube_local_cluster.md)

## Installer le Lakehouse

```bash
terragrunt run-all apply
```
Votre DNS doit résoudre **\*.lakehouse.home** par l'IP externe de l'Ingress Istio.

Aide : avec **dnsmasq**
```bash
#cat /etc/NetworkManager/dnsmasq.d/lakehouse
address=/lakehouse.home/192.168.121.235
address=/*.lakehouse.home/192.168.121.235
```

## Utiliser le Lakehouse

- [Démarrer un notebook](experiences/ex1_start_lab.md)
- [Convertir un fichier CSV en ORC et en Parquet](experiences/ex2_csv_orc_parquet.md)
- Entraîner un modèle avec Spark et le sauvegarder dans MlFlow (en cours)
- Entraîner un modèle avec Kubeflow et le sauvegarder dans MlFlow (en cours)