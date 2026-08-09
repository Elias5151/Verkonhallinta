#!/usr/bin/env bash

set -e

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TOPOLOGY_FILE="${ROOT_DIR}/Topology/golden.clab.yml"
STUDENT_ID="${STUDENT_ID:-student01}"
NETBOX_COMPOSE_FILE="${ROOT_DIR}/configs/netbox/docker-compose.yml"
NETBOX_ENV_FILE="${ROOT_DIR}/configs/netbox/.env"

echo "[INFO] Tallennetaan opiskelijan tila ennen ympäristön tuhoamista..."
bash "${ROOT_DIR}/scripts/persist/student-state-sync.sh" "${STUDENT_ID}" >/dev/null

echo "[INFO] Suljetaan ympäristö..."

if [ -f "$NETBOX_COMPOSE_FILE" ] && [ -f "$NETBOX_ENV_FILE" ]; then
	echo "[INFO] Suljetaan NetBox-pino..."
	docker compose -f "$NETBOX_COMPOSE_FILE" --env-file "$NETBOX_ENV_FILE" down
fi

sudo containerlab destroy -t "$TOPOLOGY_FILE" 

echo "[OK] Ympäristö poistettu ja tila tallennettu opiskelijalle ${STUDENT_ID}"