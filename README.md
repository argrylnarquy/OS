# OS_2024_2025

## Getting started

## comment utiliser mon dossier des exos

#### Génération des clés

- ssh-keygen -t rsa -b 2048 -f ~/.ssh/ansible_key -N ""

#### partage des clés

ssh-copy-id -i ~/.ssh/ansible_key.pub vagrant@192.168.2.23  # Pour Debian
ssh-copy-id -i ~/.ssh/ansible_key.pub vagrant@192.168.2.22  # Pour Arch Linux
ssh-copy-id -i ~/.ssh/ansible_key.pub vagrant@192.168.2.21  # Pour Fedora


- ansible-playbook -i ~/dossier_partage/ansible_labo2/inventories/inventory.yml ~/dossier_partage/ansible_labo2/playbooks/display_distribution.yml

- sudo systemctl stop firewalld
pour le pre feu pour que nmap puisse le voir

- ~/dossier_partage/ansible_labo2/scripts/dynamic_inventory.sh
pour le fichier script de l'inventaire dynamique

- ansible-inventory -i ~/dossier_partage/ansible_labo2/scripts/dynamic_inventory.sh --list
pour lancer le script dynamique avec ansible

| Commande                                           | Description                                        |
|----------------------------------------------------|----------------------------------------------------|
| `ansible all -m command -a "uptime"`               | Affiche le temps d’activité des machines.          |
| `ansible all -m command -a "tail -n 3 /var/log/auth.log"` | Affiche les 3 dernières lignes du log de connexion. |
| `ansible all -m command -a "touch /tmp/moi"`       | Crée un fichier nommé `moi`.                       |
| `ansible all -m command -a "whoami"`               | Affiche l'utilisateur connecté.                    |
| `ansible all -m command -a "whoami" -b`            | Affiche l'utilisateur avec élévation de privilèges.|

- ansible-lint ~/dossier_partage/ansible_labo2/playbooks/configure_nginx.yml
- yamllint ~/dossier_partage/ansible_labo2/playbooks/configure_nginx.yml
- ansible-playbook --syntax-check ~/dossier_partage/ansible_labo2/playbooks/configure_nginx.yml
- ansible-inventory -i ~/dossier_partage/ansible_labo2/inventories/inventory.yml --list

pour les vérification des commandes
0334cdc (mon premier commit sur git)


- ansible-playbook -i inventories/inventory.yml playbooks/setup_services.yml

- ansible-playbook -i inventories/inventory.yml playbooks/setup_services.yml --tags update
- ansible-playbook -i inventories/inventory.yml playbooks/setup_services.yml --tags install
-ansible-playbook -i inventories/inventory.yml playbooks/setup_services.yml --tags start

pour l'installation de samba on utilisera le --tags samba et pour maraiDB le tags mariadb


# exercice sur docker

- lancer l'image
* sudo docker build -t image_nomprenom .*

- voir la taille de l'imlage
  *sudo docker images | grep image_nomprenom*
- création du volume
*docker volume create volume_NomPrenom*

docker run -d \
  -p 8080:80 \                     # Mapping du port 80 (conteneur) vers 8080 (VM)
  -v volume_NomPrenom:/mon_volume \ # Montage du volume
  --name container_nomprenom \      # Nom du conteneur
  image_nompremon

# network
sudo docker network create \
  --driver bridge \
  --subnet=192.168.1.0/24 \
  --gateway=192.168.1.254 \
  --ip-range=192.168.1.0/28 \
  net_NomPrenom
Explication :

--driver bridge : Définit le type de réseau comme un réseau pont.
--subnet=192.168.1.0/24 : Définit le sous-réseau.
--gateway=192.168.1.254 : Définit la passerelle comme la dernière adresse du sous-réseau.
--ip-range=192.168.1.0/28 : Limite les adresses disponibles aux 16 premières IP (de 192.168.1.1 à 192.168.1.15).

######## connecter le container au réseau

- sudo docker network connect net_NomPrenom container_nomprenom

### connaistre l'addresse ip du container_nomprenom

sudo docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_nomprenom
#### Lance un deuxième conteneur sur le même réseau pour qu'il puisse accéder au site web du premier

- sudo docker run -it --net=net_NomPrenom --name client_container debian:bullseye-slim bash

#### installer curl dans le container par la suite
-apt-get update && apt-get install -y curl

#### tester l'accès au container par son nom étant dans le container client

 curl http://container_nomprenom


sudo docker build -t db_image .

sudo docker build -t sql_client_image .

sudo docker network create \
  --driver bridge \
  --subnet=192.168.1.0/24 \
  --ip-range=192.168.1.0/28 \
  --gateway=192.168.1.254 \
  net_NomPrenom

sudo docker run -d \
  --name db_container \
  --net=net_NomPrenom \
  -v DB:/var/lib/mysql \
  db_image


sudo docker run -it \
  --name sql_client \
  --net=net_NomPrenom \
  sql_client_image \
  mysql -h db_container -utestuser -ptestpassword -D testdb


SELECT * FROM users;

#### stopper tous les conflits avec samba
sudo systemctl stop smbd nmbd winbind
sudo systemctl disable smbd nmbd winbind

#### redemarrer samba par la suite
sudo systemctl restart samba-ad-dc
sudo systemctl status samba-ad-dc

nameserver 127.0.0.1

search argryl.linux


après avoir réinstaller les machines on doit faire cette commande pour éviter les conflits entre les anciennes clés

 ssh-keygen -f "/home/vagrant/.ssh/known_hosts" -R "192.168.2.23"
 ssh-keygen -f "/home/vagrant/.ssh/known_hosts" -R "debian"

### 1 Vérifier les utilisateurs dans Samba

sudo samba-tool user list

### 2 Vérifier les groupes et leurs membres

sudo samba-tool group listmembers itguy
sudo samba-tool group listmembers accountant



