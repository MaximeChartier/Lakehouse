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

## Installation des composants du Datalake

```
cd install
terraform init
terrafom apply
```

## Configuration des composants du Datalake

```
cd config
terraform init
terrafom apply
```