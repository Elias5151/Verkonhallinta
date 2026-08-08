#!/usr/bin/env bash

set -e

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TOPOLOGY_FILE="${ROOT_DIR}/Topology/golden.clab.yml"
STUDENT_ID="${STUDENT_ID:-student01}"

echo "[INFO] Tallennetaan opiskelijan tila ennen ympäristön tuhoamista..."
bash "${ROOT_DIR}/scripts/persist/student-state-sync.sh" "${STUDENT_ID}" >/dev/null

echo "[INFO] Suljetaan ympäristö..."

sudo containerlab destroy -t "$TOPOLOGY_FILE" 

echo "[OK] Ympäristö poistettu ja tila tallennettu opiskelijalle ${STUDENT_ID}"