#!/bin/bash

source config/theme.conf

echo -e "${BLUE}=== Ajout d'un équipement ===${NC}"

# Demander les informations
echo -e "${YELLOW}Type (PC/Serveur/Imprimante) :${NC}"
read TYPE

echo -e "${YELLOW}Marque/Modèle :${NC}"
read MARQUE

echo -e "${YELLOW}Adresse IP :${NC}"
read IP

echo -e "${YELLOW}Statut (Actif/En Stock/En Panne) :${NC}"
read STATUT

# Générer un ID unique
ID=$(date +%s)

# Ajouter dans le CSV
echo "$ID,$TYPE,$MARQUE,$IP,$STATUT" >> db/assets.csv

echo -e "${GREEN}✅ Équipement ajouté avec l'ID : $ID${NC}"
