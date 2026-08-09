#!/bin/bash
set -euo pipefail

NODE_EXPORTER_VERSION="${NODE_EXPORTER_VERSION:-1.8.2}"
NODE_EXPORTER_ARCH="amd64"
NODE_EXPORTER_DIR="/opt/node_exporter"
NODE_EXPORTER_BIN="${NODE_EXPORTER_DIR}/node_exporter"
NODE_EXPORTER_LISTEN="0.0.0.0:9100"
NODE_EXPORTER_PIDFILE="/var/run/node_exporter.pid"
NODE_EXPORTER_LOGFILE="/var/log/node_exporter.log"

if [ ! -x "${NODE_EXPORTER_BIN}" ]; then
  mkdir -p "${NODE_EXPORTER_DIR}"
  curl -fsSL "https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.linux-${NODE_EXPORTER_ARCH}.tar.gz" -o /tmp/node_exporter.tgz
  tar -xzf /tmp/node_exporter.tgz -C /tmp
  install -m 0755 /tmp/node_exporter-${NODE_EXPORTER_VERSION}.linux-${NODE_EXPORTER_ARCH}/node_exporter "${NODE_EXPORTER_BIN}"
  rm -rf /tmp/node_exporter.tgz /tmp/node_exporter-${NODE_EXPORTER_VERSION}.linux-${NODE_EXPORTER_ARCH}
fi

if [ -f "${NODE_EXPORTER_PIDFILE}" ]; then
  OLD_PID="$(cat "${NODE_EXPORTER_PIDFILE}" 2>/dev/null || true)"
  if [ -n "${OLD_PID}" ] && kill -0 "${OLD_PID}" 2>/dev/null; then
    echo "node_exporter already running (pid ${OLD_PID})"
    exit 0
  fi
fi

if ss -ltn 2>/dev/null | grep -q ":9100"; then
  echo "port 9100 already in use, skipping start"
  exit 0
fi

nohup "${NODE_EXPORTER_BIN}" --web.listen-address="${NODE_EXPORTER_LISTEN}" >"${NODE_EXPORTER_LOGFILE}" 2>&1 &
NEW_PID="$!"
echo "${NEW_PID}" > "${NODE_EXPORTER_PIDFILE}"

if kill -0 "${NEW_PID}" 2>/dev/null; then
  echo "node_exporter started (pid ${NEW_PID})"
else
  echo "failed to start node_exporter" >&2
  exit 1
fi
