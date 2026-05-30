# Inventaire-CLI — Gestion d'inventaire informatique en Bash

Projet de fin de module — Linux | ISMAGI 2025-2026

## Description
Application CRUD de gestion d'inventaire informatique en Bash/Linux. Pilotable via un wrapper CLI `inv` (add, ls, status, rm, search). Stockage CSV, affichage colorisé en terminal avec awk, génération d'un dashboard HTML dynamique. Développé sous WSL/Ubuntu dans le cadre du module Linux à l'ISMAGI.

## Technologies utilisées
- Bash / Shell scripting
- WSL (Ubuntu)
- awk / sed
- HTML / CSS (dashboard généré dynamiquement)

## Fonctionnalités
| Commande | Description |
|----------|-------------|
| `inv add` | Ajouter un équipement |
| `inv ls --mode console` | Affichage colorisé en terminal |
| `inv ls --mode browser` | Générer le dashboard HTML |
| `inv status ID Statut` | Modifier le statut |
| `inv rm ID` | Supprimer un équipement |
| `inv search IP` | Rechercher par adresse IP |
| `inv --help` | Aide |

## Installation
```bash
git clone https://github.com/Yacert/Inventaire-CLI.git
cd Inventaire-CLI
chmod +x inv
./inv --help
```

## Réalisé par
- Yacert Ouattara
