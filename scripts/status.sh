#!/usr/bin/env bash

set -e

TOPOLOGY_FILE="topology/golden.clab.yml"

echo ""
echo "===== Containerlab ====="
containerlab inspect -t "$TOPOLOGY_FILE"

echo ""
echo "===== Docker Containers ====="
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"