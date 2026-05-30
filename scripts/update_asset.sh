#!/bin/bash

source config/theme.conf

echo -e "${BLUE}=== Mise à jour d'un équipement ===${NC}"

echo -e "${YELLOW}ID de l'équipement à modifier :${NC}"
read ID

# Vérifier si l'ID existe
LIGNE=$(grep "^$ID," db/assets.csv)

if [ -z "$LIGNE" ]; then
    echo -e "${RED}❌ Équipement introuvable !${NC}"
    exit 1
fi

echo -e "${GREEN}Équipement trouvé : $LIGNE${NC}"

echo -e "${YELLOW}Nouveau statut (Actif/En Stock/En Panne) :${NC}"
read STATUT

# Remplacer le statut avec sed
sed -i "s/^$ID,\(.*\),.*$/$ID,\1,$STATUT/" db/assets.csv

echo -e "${GREEN}✅ Statut mis à jour avec succès !${NC}"
