# Ansible Inventory Documentation

## Overview

Ansible inventory for the HAMK Network Management Lab containerlab topology. The inventory is organized into logical groups reflecting the network architecture.

## Inventory Structure

### Network Device Groups

#### `[routers]`
FRR-based network routers:
- **r1**: Core router, user network gateway (10.10.10.0/24)
- **r2**: Core router, server network gateway (10.10.20.0/24)
- **r3**: Branch office router (10.10.30.0/24)

Connection: `network_cli` with FRR network OS settings

#### `[clients]`
End-user workstations:
- **client1**: Ubuntu workstation (10.10.10.101)
- **attacker**: Kali Linux security testing host (10.10.10.200)
- **branch-client**: Branch office Ubuntu workstation (10.10.30.101)

#### `[servers]`
Application servers:
- **web1**: Web server Ubuntu (10.10.20.101)
- **db1**: Database server Ubuntu (10.10.20.102)

#### `[monitoring]`
Monitoring and observability stack:
- **prometheus**: Metrics collection (port 9090)
- **grafana**: Visualization dashboard (port 3000)
- **zabbix**: Enterprise monitoring (port 8080)
- **cadvisor**: Container metrics (port 8080)

#### `[management]`
Management tools:
- **ansible**: Ansible control node

### Logical Network Segments

- `[user_network]`: client1, attacker
- `[server_network]`: web1, db1
- `[branch_office]`: branch-client

### Infrastructure Groups

- `[network_devices]`: All routers
- `[linux_hosts]`: All Linux-based nodes
- `[ubuntu_hosts]`: Ubuntu-specific nodes
- `[node_exporter]`: Nodes running Prometheus node_exporter

## Connection Settings

### Default Variables (`[all:vars]`)
```ini
ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
ansible_become=no
```

### Router Variables
- `ansible_network_os=frr`
- `ansible_connection=network_cli`
- `ansible_user=admin`

### Linux Host Variables
- `ansible_connection=ssh`
- `ansible_user=root`
- `ansible_python_interpreter=/usr/bin/python3`

## Usage Examples

### Test Inventory Connectivity
```bash
# From ansible container or host with ansible installed
ansible-playbook -i /ansible/inventory.ini /ansible/playbooks/test-inventory.yml
```

### Ping All Hosts
```bash
ansible all -i /ansible/inventory.ini -m ping
```

### Ping Specific Group
```bash
ansible routers -i /ansible/inventory.ini -m ping
ansible servers -i /ansible/inventory.ini -m ping
```

### Run Ad-hoc Commands
```bash
# Check uptime on all Ubuntu hosts
ansible ubuntu_hosts -i /ansible/inventory.ini -a "uptime"

# Check disk space on servers
ansible servers -i /ansible/inventory.ini -a "df -h"
```

### Execute Playbooks
```bash
# Install node_exporter on all targets
ansible-playbook -i /ansible/inventory.ini /ansible/playbooks/install-node-exporter.yml

# Configure SNMP on routers
ansible-playbook -i /ansible/inventory.ini /ansible/playbooks/install-snmp.yml
```

## Host Variables

Each host includes custom variables for identification:

- **data_ip**: IP address on the data/user network
- **role**: Server role (webserver, database)
- **service**: Service name for monitoring nodes
- **port**: Exposed service port

Access these in playbooks:
```yaml
- name: Example task using host variables
  debug:
    msg: "{{ inventory_hostname }} data IP: {{ data_ip }}"
```

## Containerlab Integration

All hosts use their full containerlab container names:
- Format: `clab-hamk-verkonhallinta-golden-<nodename>`
- Management network: `clab-mgmt` (172.20.20.0/24)
- DNS resolution works within containerlab network

## Troubleshooting

### Host unreachable
1. Verify containerlab topology is running: `sudo containerlab inspect -t golden.clab.yml`
2. Check container names: `docker ps --filter "name=clab-hamk"`
3. Test manual connection: `docker exec clab-hamk-verkonhallinta-golden-client1 hostname`

### Python not found
- Ubuntu containers may need python3 installed
- Update inventory python interpreter path if needed

### Permission denied
- Containerlab uses root by default
- Verify `ansible_user=root` in group vars
- Check SSH key configuration if using key-based auth

## Maintenance

Update inventory when:
- Adding/removing nodes in topology
- Changing IP addressing scheme
- Modifying network segmentation
- Adding new service roles
