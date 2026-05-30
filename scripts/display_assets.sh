#!/bin/bash

source config/theme.conf

MODE=$1

if [ "$MODE" = "--mode" ]; then
    MODE=$2
fi

if [ "$MODE" = "console" ]; then
    echo -e "${BLUE}=== Inventaire Informatique ===${NC}"
    echo -e "${YELLOW}ID\t\tType\t\tMarque\t\tIP\t\tStatut${NC}"
    echo "------------------------------------------------"

    tail -n +2 db/assets.csv | while IFS=',' read ID TYPE MARQUE IP STATUT; do
        if [ "$STATUT" = "Actif" ]; then
            COLOR=$GREEN
        elif [ "$STATUT" = "En Panne" ]; then
            COLOR=$RED
        else
            COLOR=$YELLOW
        fi
        echo -e "${COLOR}$ID\t$TYPE\t\t$MARQUE\t\t$IP\t\t$STATUT${NC}"
    done

elif [ "$MODE" = "browser" ]; then
    TOTAL=$(tail -n +2 db/assets.csv | wc -l | tr -d ' ')
    ENPANNE=$(grep -c "En Panne" db/assets.csv || echo 0)

    TABLEAU=""
    while IFS=',' read ID TYPE MARQUE IP STATUT; do
        if [ "$STATUT" = "En Panne" ]; then
            CLASS="panne"
        elif [ "$STATUT" = "Actif" ]; then
            CLASS="actif"
        else
            CLASS="stock"
        fi
        TABLEAU="${TABLEAU}<tr><td>${ID}</td><td>${TYPE}</td><td>${MARQUE}</td><td>${IP}</td><td class='${CLASS}'>${STATUT}</td></tr>"
    done < <(tail -n +2 db/assets.csv)

    cp templates/dashboard.html.tpl inventory_dashboard.html
    sed -i "s|%%TOTAL%%|$TOTAL|g" inventory_dashboard.html
    sed -i "s|%%ENPANNE%%|$ENPANNE|g" inventory_dashboard.html
    sed -i "s|%%TABLEAU%%|$TABLEAU|g" inventory_dashboard.html

    echo -e "${GREEN}✅ Dashboard généré : inventory_dashboard.html${NC}"

    xdg-open inventory_dashboard.html 2>/dev/null || \
    open inventory_dashboard.html 2>/dev/null || \
    echo -e "${YELLOW}⚠️ Pas d'interface graphique. Ouvrez manuellement inventory_dashboard.html${NC}"

else
    echo -e "${RED}❌ Mode invalide. Utilisez --mode console ou --mode browser${NC}"
fi
