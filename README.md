# Lakehouse

[Documentation](doc/README.md)

Ce répo est un outil permettant l'installation et la configuration d'un environnement Datalake basé sur Kubernetes.
Voici la liste des composants disponible aprés installation :
- **Infrastructure**
    - **Minio** : Object storage S3
    - **Istio** : Servie Mesh cloud native
    - **Argo-Events** : Event-Based Dependency Manager for Kubernetes
- **Sécurité**
    - **Keycloak** : Identity and Access Management
    - **OpenLdap** : Lightweight Directory Access Protocol
- **Environnement de travail**
    - **Mlflow** : A Machine Learning Lifecycle Platform
    - **MariaDB** : SGBD relationnel
    - **Apache Spark** : Unified engine for large-scale data analytics
    - **JupyterHub** : "the best way to serve Jupyter notebook for multiple users"
    - **JupyterLab** (par utilisateur) : A Next-Generation Notebook Interface

## Installation

Assurez-vous que `kubectl` est correctement configuré.
```bash
terragrunt run-all apply
```

## Backlog

- Configurer Mlflow pour stocker les modèles dans un bucket S3
- Sécuriser l'accès au Spark master
- Installer Kubeflow
- Automatiser la configuration des drivers Spark dans les singleusers pods
- Sécuriser l'accès aux routes {username}.sparkui.lakehouse.home
- Supprimer les Services et VirtualService généré après l'arrêts des pods JupyterLab
- Mettre en place un proxy pip et un proxy docker
- Rendre le nom de domaine racine dynamic "lakehouse.home"