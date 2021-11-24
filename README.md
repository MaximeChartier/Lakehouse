# Préparation d'un environnement de test

## Prérequis
 - Avoir une clé SSH RSA nommée "id_rsa.pub"

## Installation de Libvirt

```bash
sudo apt update
sudo apt install qemu libvirt-daemon-
# utile pour installer le plugin Vagrant
sudo apt install libvirt-dev
#Décommenter la ligne -> unix_sock_group = "libvirt"
#Décommenter la ligne -> unix_sock_rw_perms = "0770"
sudo vi /etc/libvirt/libvirtd.conf
#Redémarrage du service libvirt
sudo systemctl restart libvirtd.service
```

## Installation Vagrant

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update
sudo apt install vagrant
```

## Installation du krew (plugin kubectl)

https://krew.sigs.k8s.io/docs/user-guide/setup/install/

## Installation du plugin libvirt pour Vagrant

```bash
vagrant plugin install vagrant-libvirt
```

## Téléchargement de l'image Alpine pour Libvirt

```bash
vagrant box add generic/debian10 --provider=libvirt
```

## Installation Ansible

```bash
#Installation de ansible dans un environnement Conda
conda create -n ansible
conda activate ansible
conda install python==3.9.7
pip install ansible
```

## Création de 3 VM en local (avec Vagrant)

```bash
vagrant up
```

# Provisionning de l'environnement

## Installation de Kubernetes

```bash
#Provisionning
ansible-playbook kubernetes/site.yml -i kubernetes/inventory/vagrant/hosts.ini
#Récupération de la conf pour la connexion au cluster
scp root@192.168.50.11:~/.kube/config ~/.kube/config_ll
```

## Installation de Flannel (provision réseau dans le cluster)

```bash
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
```

## Installation de Istio (Service mesh)

```bash
cd /opt/istio
#core
istioctl install --set profile=demo -y
#addons
kubectl apply -f samples/addons
```

## Installation du dashboard Kubernetes

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended.yaml
#récuperer le token par default (seulement en dev)
kubectl create clusterrolebinding serviceaccounts-cluster-admin --clusterrole=cluster-admin --group=system:serviceaccounts
kubectl -n kube-system describe secret default| awk '$1=="token:"{print $2}'
#acces au dashboard
kubectl proxy
```


## Installation de Minio (avec Krew)

```bash
kubectl krew update
kubectl krew install minio
#installation de minio operator
kubectl minio init
kubectl minio tenant create tenant1 --servers 3 --volumes 6 --capacity 4Gi
#Accéder a la console Minio
kubectl minio proxy
```

# Compute

## Installation de Spark

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install spark bitnami/spark
```

## Installation de Zeppelin
```bash
kubectl apply -f zeppelin/
#Vérification du service
kubectl port-forward service/zeppelin-server 8888:80 
```


# Pipeline

## Airflow
```bash
#install
kubectl create namespace airflow
helm repo add apache-airflow https://airflow.apache.org
helm install airflow apache-airflow/airflow --namespace airflow
#uninstall
helm uninstall airflow apache-airflow/airflow --namespace airflow
```
