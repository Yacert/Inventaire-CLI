<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inventaire Informatique</title>
    <style>
        body { font-family: Arial, sans-serif; background: #1e1e2e; color: #cdd6f4; }
        h1 { text-align: center; color: #89b4fa; }
        table { width: 90%; margin: auto; border-collapse: collapse; }
        th { background: #313244; padding: 10px; }
        td { padding: 8px; text-align: center; border-bottom: 1px solid #45475a; }
        .actif { color: #a6e3a1; }
        .panne { color: #f38ba8; }
        .stock { color: #f9e2af; }
        .stats { text-align: center; margin: 20px; font-size: 1.2em; }
    </style>
</head>
<body>
    <h1>🖥️ Dashboard Inventaire</h1>
    <div class="stats">
        <p>Total équipements : <strong>%%TOTAL%%</strong></p>
        <p>En panne : <strong class="panne">%%ENPANNE%%</strong></p>
    </div>
    <table>
        <tr><th>ID</th><th>Type</th><th>Marque</th><th>IP</th><th>Statut</th></tr>
        %%TABLEAU%%
    </table>
</body>
</html>
