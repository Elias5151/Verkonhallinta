# prometheus monitoring

kirjaudu web1 koneelle:

```bash
docker exec -it clab-hamk-verkonhallinta-golden-web1 bash
```

Asenna koneelle prometheus exporter:

```bash
apt update
apt install wget tar -y

wget https://github.com/prometheus/node_exporter/releases/latest/download/node_exporter-*.linux-amd64.tar.gz
```

Luo tämän jälkeen Grafanaan uusi dashboard:

## cpu
100 - (avg by(instance)
(rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

## muisti
(node_memory_MemTotal_bytes -
 node_memory_MemAvailable_bytes)
/
node_memory_MemTotal_bytes
* 100

## levytila
100 -
(
node_filesystem_avail_bytes
/
node_filesystem_size_bytes
* 100
)

## verkkoliikenne
rate(node_network_receive_bytes_total[5m])
rate(node_network_transmit_bytes_total[5m])