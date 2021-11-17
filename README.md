# Installation de Libvirt

```bash
sudo apt update
sudo apt install qemu libvirt-daemon-
# utile pour installer le plugin Vagrant
sudo apt install libvirt-dev
```

# Installation Vagrant

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
sudo vagrant plugin install vagrant-libvirt
```

# Téléchargement de l'image Alpine pour Libvirt

```bash
sudo vagrant box add generic/alpine38 --provider=libvirt
```

# Installation de Kubernetes

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
```


## Installation de Minio

```bash
kubectl krew update
kubectl krew install minio
#installation de minio operator
kubectl minio init
kubectl minio tenant create tenant1 --servers 3 --volumes 6 --capacity 4Gi
```

# Notebook
## Installation de Zeppelin
```bash
kubectl apply -f https://raw.githubusercontent.com/apache/zeppelin/master/k8s/zeppelin-server.yaml
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
