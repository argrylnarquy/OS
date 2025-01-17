#!/bin/bash
# Créer l'utilisateur ntan et configurer les permissions sudo
useradd -m -s /bin/bash -G sudo ntan
echo 'ntan ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Installation d'OpenSSL
apt-get update
apt-get install -y openssl

# Installation de Docker
# 1. Installer les prérequis
sudo apt-get install -y ca-certificates curl

# 2. Ajouter la clé GPG officielle de Docker
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# 3. Ajouter le dépôt Docker aux sources APT
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 4. Installer Docker et ses plugins
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Installation d'Ansible
UBUNTU_CODENAME=$(lsb_release -cs)
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/ansible.list
sudo apt-get update
sudo apt-get install -y ansible
