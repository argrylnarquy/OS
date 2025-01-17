#!/bin/bash

# Mettre à jour les paquets et installer rsync, openssl, et python3
sudo apt-get update
sudo apt-get install -y rsync openssl python3 sudo

# Créer l'utilisateur 'ntan' et l'ajouter au groupe sudo
sudo useradd -m -s /bin/bash -G sudo ntan
echo 'ntan ALL=(ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers

# Configurer le clavier en français belge
echo "XKBLAYOUT=fr" | sudo tee /etc/default/keyboard
echo "XKBVARIANT=be" | sudo tee -a /etc/default/keyboard
sudo dpkg-reconfigure -f noninteractive keyboard-configuration
