#!/bin/bash
echo "Test si l'application React fonctionne..."
sleep 3
if curl -f http://localhost:80; then
    echo "✅ TEST PASSÉ : L'application marche"
    exit 0
else
    echo "❌ TEST ÉCHOUÉ : L'application ne marche pas"
    exit 1
fi