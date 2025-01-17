#!/bin/bash
# Définir le réseau à scanner (à adapter selon votre configuration)
NETWORK="192.168.2.0/24"

# Scanner le réseau avec nmap pour détecter les hôtes actifs
HOSTS=$(nmap -sn $NETWORK | grep "Nmap scan report" | awk '{print $5}')

# Début de la sortie JSON
echo '{
  "_meta": {
    "hostvars": {}
  },
  "all": {
    "hosts": ['

# Boucle pour ajouter chaque hôte détecté
FIRST=true
for HOST in $HOSTS; do
  if [ "$FIRST" = true ]; then
    echo "    \"$HOST\""
    FIRST=false
  else
    echo "    ,\"$HOST\""
  fi
done

# Fin de la sortie JSON
echo '  ]
  }
}'
