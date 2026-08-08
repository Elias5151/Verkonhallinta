#!/usr/bin/env bash

set -e

# ----------------------------------------------------
# HAMK Verkonhallinta Golden Topology
# Deploy script
# ----------------------------------------------------

TOPOLOGY_FILE="topology/golden.clab.yml"

echo ""
echo "========================================="
echo " HAMK Verkonhallinta Topology"
echo "========================================="
echo ""

# ----------------------------------------------------
# Check prerequisites
# ----------------------------------------------------

echo "[INFO] Tarkistetaan riippuvuudet..."

if ! command -v docker >/dev/null 2>&1; then
    echo "[ERROR] Docker ei ole asennettu."
    exit 1
fi

if ! command -v containerlab >/dev/null 2>&1; then
    echo "[ERROR] Containerlab ei ole asennettu."
    exit 1
fi

echo "[OK] Docker löytyi"
echo "[OK] Containerlab löytyi"

# ----------------------------------------------------
# Check topology file
# ----------------------------------------------------

if [ ! -f "$TOPOLOGY_FILE" ]; then
    echo "[ERROR] Topologiatiedostoa ei löydy:"
    echo "        $TOPOLOGY_FILE"
    exit 1
fi

# ----------------------------------------------------
# Create directories
# ----------------------------------------------------

echo ""
echo "[INFO] Luodaan tarvittavat hakemistot..."

mkdir -p logs
mkdir -p captures
mkdir -p reports
mkdir -p reports/generated

touch logs/.gitkeep
touch captures/.gitkeep
touch reports/.gitkeep
touch reports/generated/.gitkeep

echo "[OK] Hakemistot valmiina"

# ----------------------------------------------------
# Deploy lab
# ----------------------------------------------------

echo ""
echo "[INFO] Käynnistetään Containerlab..."

sudo containerlab deploy -t "$TOPOLOGY_FILE"

echo ""
echo "[INFO] Tarkistetaan ympäristö..."

containerlab inspect -t "$TOPOLOGY_FILE"

# ----------------------------------------------------
# Service information
# ----------------------------------------------------

echo ""
echo "========================================="
echo " YMPÄRISTÖ KÄYNNISSÄ"
echo "========================================="
echo ""

echo "Grafana:"
echo "http://localhost:3000"
echo ""

echo "Prometheus:"
echo "http://localhost:9090"
echo ""

echo "Zabbix:"
echo "http://localhost:8080"
echo ""

echo "NetBox (jos käytössä):"
echo "http://localhost:8000"
echo ""

echo "========================================="
echo " Seuraavat askeleet"
echo "========================================="
echo ""

echo "Tarkista topologia:"
echo "containerlab inspect -t $TOPOLOGY_FILE"
echo ""

echo "Luo verkkokaavio:"
echo "containerlab graph -t $TOPOLOGY_FILE"
echo ""

echo "Kirjaudu client1-konttiin:"
echo "docker exec -it clab-hamk-verkonhallinta-golden-client1 bash"
echo ""

echo "Sulje ympäristö:"
echo "bash scripts/destroy.sh"
echo ""

echo "[OK] Käyttöönotto valmis"