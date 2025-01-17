#!/bin/bash

# Répertoire où les clés SSH seront stockées
KEY_DIR="$HOME/.ssh/vagrant_keys"
mkdir -p "$KEY_DIR"

# Liste des machines pour lesquelles on va générer des clés
MACHINES=("fedora" "archlinux" "debian")

# Générer les clés SSH pour chaque machine
for MACHINE in "${MACHINES[@]}"; do
    KEY_PATH="$KEY_DIR/${MACHINE}_key"
    
    # Vérifier si la clé existe déjà pour éviter d'écraser une clé existante
    if [ ! -f "$KEY_PATH" ]; then
        echo "Génération de la clé SSH pour $MACHINE..."
        ssh-keygen -t rsa -b 2048 -f "$KEY_PATH" -N "" -C "$MACHINE-key"
        echo "Clé générée pour $MACHINE : $KEY_PATH"
    else
        echo "La clé pour $MACHINE existe déjà : $KEY_PATH"
    fi
done
