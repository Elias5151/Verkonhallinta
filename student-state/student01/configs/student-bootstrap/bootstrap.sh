#!/bin/bash
set -euo pipefail

NODE_EXPORTER_VERSION="${NODE_EXPORTER_VERSION:-1.8.2}"
NODE_EXPORTER_ARCH="amd64"
NODE_EXPORTER_DIR="/opt/node_exporter"
NODE_EXPORTER_BIN="${NODE_EXPORTER_DIR}/node_exporter"
NODE_EXPORTER_SERVICE="/etc/systemd/system/node-exporter.service"

if [ ! -x "${NODE_EXPORTER_BIN}" ]; then
  mkdir -p "${NODE_EXPORTER_DIR}"
  curl -fsSL "https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.linux-${NODE_EXPORTER_ARCH}.tar.gz" -o /tmp/node_exporter.tgz
  tar -xzf /tmp/node_exporter.tgz -C /tmp
  install -m 0755 /tmp/node_exporter-${NODE_EXPORTER_VERSION}.linux-${NODE_EXPORTER_ARCH}/node_exporter "${NODE_EXPORTER_BIN}"
  rm -rf /tmp/node_exporter.tgz /tmp/node_exporter-${NODE_EXPORTER_VERSION}.linux-${NODE_EXPORTER_ARCH}
fi

cat > "${NODE_EXPORTER_SERVICE}" <<'EOF'
[Unit]
Description=Node Exporter
After=network.target

[Service]
ExecStart=/opt/node_exporter/node_exporter --web.listen-address=0.0.0.0:9100
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload || true
systemctl enable node-exporter.service || true
systemctl restart node-exporter.service || true
