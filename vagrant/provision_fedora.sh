#!/bin/bash
# Créer l'utilisateur ntan et configurer les permissions sudo
useradd -m -s /bin/bash -G wheel ntan
echo 'ntan ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Configurer le clavier en français belge
localectl set-keymap fr-be

# Installer OpenSSL
dnf install -y openssl

nmcli con add type ethernet con-name "static-eth1" ifname eth1 ipv4.addresses 192.168.2.21/24 ipv4.method manual
nmcli con up "static-eth1"
