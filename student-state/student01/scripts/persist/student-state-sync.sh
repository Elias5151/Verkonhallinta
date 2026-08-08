#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
STUDENT_ID="${1:-student01}"
STATE_ROOT="${ROOT}/student-state/${STUDENT_ID}"
mkdir -p "${STATE_ROOT}"

# Persist lab configuration and scripts for this student
cp -a "${ROOT}/configs" "${STATE_ROOT}/configs"
cp -a "${ROOT}/Topology" "${STATE_ROOT}/Topology"
cp -a "${ROOT}/scripts" "${STATE_ROOT}/scripts"

cat > "${STATE_ROOT}/student-id.txt" <<EOF
${STUDENT_ID}
EOF

echo "student state saved to ${STATE_ROOT}"
