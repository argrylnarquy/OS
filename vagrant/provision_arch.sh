#!/bin/bash
# Créer l'utilisateur ntan et configurer les permissions sudo
useradd -m -s /bin/bash -G wheel ntan
echo 'ntan ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Configurer le clavier en français belge
localectl set-keymap fr-be

# Installer OpenSSL
pacman -Syu --noconfirm
pacman -S --noconfirm openssl python python3

# vérifier l'installation de Python
python --version
python3 --version

