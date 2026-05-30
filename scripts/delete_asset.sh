#!/bin/bash

source config/theme.conf

echo -e "${BLUE}=== Suppression d'un équipement ===${NC}"

echo -e "${YELLOW}ID de l'équipement à supprimer :${NC}"
read ID

# Vérifier si l'ID existe
LIGNE=$(grep "^$ID," db/assets.csv)

if [ -z "$LIGNE" ]; then
    echo -e "${RED}❌ Équipement introuvable !${NC}"
    exit 1
fi

echo -e "${RED}Équipement trouvé : $LIGNE${NC}"
echo -e "${YELLOW}Confirmer la suppression ? (o/n) :${NC}"
read CONFIRM

if [ "$CONFIRM" = "o" ]; then
    sed -i "/^$ID,/d" db/assets.csv
    echo -e "${GREEN}✅ Équipement supprimé avec succès !${NC}"
else
    echo -e "${YELLOW}⚠️ Suppression annulée.${NC}"
fi
