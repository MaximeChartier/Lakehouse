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

## Installation du plugin libvirt pour Vagrant

```bash
sudo vagrant plugin install vagrant-libvirt
```

# Téléchargement de l'image Alpine pour Libvirt

```bash
sudo vagrant box add generic/alpine38 --provider=libvirt
```