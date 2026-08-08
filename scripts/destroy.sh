#!/usr/bin/env bash

set -e

TOPOLOGY_FILE="topology/golden.clab.yml"

echo "[INFO] Suljetaan ympäristö..."

sudo containerlab destroy -t "$TOPOLOGY_FILE" --cleanup

echo "[OK] Ympäristö poistettu"