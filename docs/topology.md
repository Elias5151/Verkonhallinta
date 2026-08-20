# Network Topology Discovery - HAMK Lab Guide

Tämä opas kattaa kaikki tavanomaiset tavat tutkia ja visualisoida labran verkkotopologiaa sekä geneerisillä verkkotyökaluilla että labran spesifisillä työkaluilla.

---

## Esiasennetut Verkkotyökalut

**Kaikissa Ubuntu ja Kali Linux -nodeissa (client1, attacker, web1, db1, branch-client) on valmiiksi asennettu:**

| Työkalu | Kuvaus | Esimerkki |
|---------|--------|-----------|
| **ping** | ICMP echo testaus | `ping 10.10.20.101` |
| **traceroute** | Reitin jäljitys | `traceroute 10.10.30.101` |
| **nslookup** | DNS-kyselyt (yksinkertainen) | `nslookup google.com 8.8.8.8` |
| **dig** | DNS-kyselyt (edistynyt) | `dig @8.8.8.8 google.com A` |
| **host** | DNS-kyselyt (nopea) | `host google.com 8.8.8.8` |
| **tcpdump** | Pakettien kaappaus | `tcpdump -i eth1 -n icmp` |
| **nmap** | Porttiskannaus | `nmap -p 22,80 10.10.20.101` |
| **mtr** | Jatkuva traceroute+ping | `mtr -n 10.10.20.101` |
| **telnet** | TCP-yhteyden testaus | `telnet 10.10.20.101 22` |
| **wget** | Tiedostojen lataus | `wget http://example.com/file` |
| **curl** | HTTP-kyselyt | `curl -I http://10.10.20.101` |
| **netstat** | Verkkoliikenne ja portit | `netstat -tuln` |
| **ifconfig** | Verkkointerface-info (legacy) | `ifconfig eth1` |
| **arp** | ARP-taulu (legacy) | `arp -n` |
| **ip** | Moderni verkko-konfiguraatio | `ip addr show`, `ip route` |
| **ss** | Socket-tilastot (moderni netstat) | `ss -tuln` |

**Huom:** Kaikki työkalut asentuvat automaattisesti topologian käynnistyksen yhteydessä. Ei tarvitse manuaalista `apt-get install` -komentoa!

**Testattu toimivuus:**
```bash
# Esimerkki client1:ltä
docker exec clab-hamk-verkonhallinta-golden-client1 traceroute -n 10.10.20.101
# Näyttää reitin: client1 → r1 → r2 → web1
```

---

## Sisällysluettelo
1. [Lab-Spesifit Työkalut](#lab-spesifit-työkalut)
2. [Geneerisit Verkkotyökalut](#geneerisit-verkkotyökalut)
3. [Dokumentaatio ja Konfiguraatiot](#dokumentaatio-ja-konfiguraatiot)
4. [Käytännön Esimerkit](#käytännön-esimerkit)

---

## Lab-Spesifit Työkalut

### 1. Containerlab Inspect

**Nopein tapa nähdä koko topologia**

```bash
# Koko topologian tila
sudo containerlab inspect -t ~/Verkonhallinta/topology/golden.clab.yml

# Lyhyt muoto
sudo containerlab inspect -t ~/Verkonhallinta/topology/golden.clab.yml --format brief

# Pelkät linkit
sudo containerlab inspect -t ~/Verkonhallinta/topology/golden.clab.yml --format json | jq '.links'
```

**Mitä näkyy:**
- Kaikkien konttien nimet, tilat ja IP-osoitteet
- Kaikki linkit kahden noden välillä
- Containerlab-verkot (clab-mgmt)

**Käyttötapaus:** Nopea yleiskuva koko labran rakenteesta ja tiloista.

---

### 2. NetBox - Graafinen Topologiavisualisointi

**Web-pohjainen topologianhallinta ja visualisointi**

#### Pääsy NetBoxiin:
```
URL: http://localhost:8000
Käyttäjä: admin
Salasana: admin
```

#### Topologianäkymät:

**Topology Views Plugin:**
1. Kirjaudu NetBoxiin
2. Navigoi: **Plugins** → **Topology Views**
3. Valitse näkymä:
   - **Labra Full** - Koko labran topologia
   - **Labra Core** - Core-reitittimet ja palvelimet
   - **Labra Management** - Hallintaverkko

**Näkyy:**
- Graafinen verkkokaavio
- Laitteiden väliset kaapelit
- IP-osoitteet ja interfacet
- Laitetyypit ja roolit
- Zoom ja pan -toiminnot

**REST API - Ohjelmallinen pääsy:**
```bash
# Hae kaikki laitteet
curl -H "Authorization: Token YOUR_TOKEN" http://localhost:8000/api/dcim/devices/

# Hae kaapelit
curl -H "Authorization: Token YOUR_TOKEN" http://localhost:8000/api/dcim/cables/

# Hae IP-osoitteet
curl -H "Authorization: Token YOUR_TOKEN" http://localhost:8000/api/ipam/ip-addresses/
```

**Käyttötapaus:** Dokumentoitu, visuaalinen topologia joka päivittyy seedin mukana.

---

### 3. Ansible Inventory

**Loogiset laitteiden ryhmät ja hierarkia**

```bash
# Näytä kaikki hostit ja ryhmät
docker exec clab-hamk-verkonhallinta-golden-ansible \
  ansible-inventory -i /ansible/inventory.ini --list

# Graafinen puurakenne
docker exec clab-hamk-verkonhallinta-golden-ansible \
  ansible-inventory -i /ansible/inventory.ini --graph

# Tietyn hostin tiedot
docker exec clab-hamk-verkonhallinta-golden-ansible \
  ansible-inventory -i /ansible/inventory.ini --host client1
```

**Näkyy:**
- Loogiset ryhmät (routers, clients, servers, monitoring)
- Verkko-segmentit (user_network, server_network, branch_office)
- Host-muuttujat (IP-osoitteet, roolit)

**Käyttötapaus:** Ymmärrä laitteiden loogiset suhteet ja automaation rakenne.

---

### 4. Prometheus Targets

**Aktiivisten monitoring-kohteiden tila**

```bash
# Web UI
http://localhost:9090/targets

# API kysely
curl http://localhost:9090/api/v1/targets | jq
```

**Näkyy:**
- Kaikki node_exporter targetit (routers, clients, servers)
- cAdvisor konttimetriikat
- Target state (up/down)
- Viimeisin scrape-aika

**Käyttötapaus:** Tunnista mitkä laitteet ovat monitoroitavissa.

---

### 5. Grafana Dashboards

**Visuaaliset topologiset näkymät metriikoista**

```bash
# Grafana UI
http://localhost:3000
Käyttäjä: admin
Salasana: admin
```

**Dashboardit:**
- **Labra Container Observability** - Konttien resurssit ja tilat
  - Näyttää kaikki containerlab-nodet
  - CPU, memory, network per kontti
  - Service discovery Prometheuksesta

**Käyttötapaus:** Operatiivinen näkymä topologian tilaan ja suorituskykyyn.

---

## Geneerisit Verkkotyökalut

### 1. Ping - Perusyhteystestaus

**Yksinkertaisin tapa testata saavutettavuus**

```bash
# Paikallisessa verkossa (client1 → web1)
docker exec clab-hamk-verkonhallinta-golden-client1 ping -c 3 10.10.20.101

# Management-verkossa
docker exec clab-hamk-verkonhallinta-golden-client1 ping -c 3 clab-hamk-verkonhallinta-golden-ansible

# Reitityksen läpi (client1 → branch-client)
docker exec clab-hamk-verkonhallinta-golden-client1 ping -c 3 10.10.30.101
```

**Mitä opimme:**
- Onko laite saavutettavissa?
- Toimiiko reititys?
- Mikä on latenssi?

---

### 2. Traceroute - Reitin jäljitys

**Näytä mitkä reitittimet paketti kulkee** (esiasennettuna kaikissa nodeissa)

```bash
# Jäljitä reitti branchiin
docker exec clab-hamk-verkonhallinta-golden-client1 \
  traceroute 10.10.30.101

# Numeerinen muoto (nopea, ei DNS-kyselyä)
docker exec clab-hamk-verkonhallinta-golden-client1 \
  traceroute -n 10.10.30.101

# Rajoita maksimi hypyt
docker exec clab-hamk-verkonhallinta-golden-client1 \
  traceroute -n -m 10 10.10.30.101

# Odotettu tulos (client1 → branch-client):
# 1  10.10.10.1 (r1)
# 2  10.255.12.2 (r2)
# 3  10.255.23.2 (r3)
# 4  10.10.30.101 (branch-client)
```

**Mitä opimme:**
- Mitä reittejä paketit kulkevat
- Missä on pullonkauloja (korkea latenssi)
- Missä reititys katkeaa (timeout)

---

### 3. ARP - Layer 2 naapurit

**Näytä samassa verkossa olevat laitteet**

```bash
# Näytä ARP-taulu
docker exec clab-hamk-verkonhallinta-golden-client1 ip neigh show

# Esimerkki tuloste:
# 10.10.10.1 dev eth1 lladdr aa:bb:cc:dd:ee:ff REACHABLE
# 10.10.10.200 dev eth1 lladdr 11:22:33:44:55:66 STALE
```

**Mitä opimme:**
- Ketkä ovat samassa L2-segmentissä
- MAC-osoitteet
- Naapurien tila (REACHABLE, STALE, DELAY)

---

### 4. IP Route - Reititystaulut

**Tutki reititystä kussakin laitteessa**

```bash
# Client1 reititys
docker exec clab-hamk-verkonhallinta-golden-client1 ip route show

# Esimerkki:
# default via 10.10.10.1 dev eth1
# 10.10.10.0/24 dev eth1 proto kernel scope link src 10.10.10.101

# Routerin reititys (FRR)
docker exec clab-hamk-verkonhallinta-golden-r1 vtysh -c "show ip route"

# Esimerkki FRR-tuloste:
# O>* 10.10.20.0/24 [110/20] via 192.168.1.2, eth1
# O>* 10.10.30.0/24 [110/30] via 192.168.1.2, eth1
# C>* 10.10.10.0/24 is directly connected, eth2
```

**Mitä opimme:**
- Mihin suuntaan liikenne menee
- Mikä on default gateway
- OSPF-reitit routereissa

---

### 5. FRR Show Commands - Routing Protocol State

**Routereiden reititysprotokollat ja naapurit**

```bash
# OSPF naapurit
docker exec clab-hamk-verkonhallinta-golden-r1 vtysh -c "show ip ospf neighbor"

# OSPF database
docker exec clab-hamk-verkonhallinta-golden-r1 vtysh -c "show ip ospf database"

# BGP status (jos BGP käytössä)
docker exec clab-hamk-verkonhallinta-golden-r1 vtysh -c "show ip bgp summary"

# Kaikki reitit
docker exec clab-hamk-verkonhallinta-golden-r1 vtysh -c "show ip route"

# Interface-tila
docker exec clab-hamk-verkonhallinta-golden-r1 vtysh -c "show interface"
```

**Mitä opimme:**
- Ketkä routerit näkevät toisensa
- OSPF-alueet ja cost-arvot
- Reititysprotokollan tila

---

### 6. SS/Netstat - Aktiiviset yhteydet

**Tutki palvelut ja portit**

```bash
# Kuuntelevat portit
docker exec clab-hamk-verkonhallinta-golden-web1 ss -ltnp

# Esimerkki:
# State    Recv-Q Send-Q Local Address:Port  Peer Address:Port
# LISTEN   0      128    0.0.0.0:22           0.0.0.0:*         users:(("sshd",pid=123))
# LISTEN   0      128    0.0.0.0:9100         0.0.0.0:*         users:(("node_exporter",pid=456))

# Aktiiviset yhteydet
docker exec clab-hamk-verkonhallinta-golden-prometheus ss -tn

# UDP-yhteydet
docker exec clab-hamk-verkonhallinta-golden-r1 ss -un
```

**Mitä opimme:**
- Mitkä palvelut kuuntelevat
- Aktiiviset TCP/UDP yhteydet
- Prosessit ja portit

---

### 7. TCPDump - Liikenne-analyysi

**Sieppaa ja analysoi verkkoliikennettä** (esiasennettuna kaikissa nodeissa)

```bash
# Kaappaa kaikki liikenne eth1:ssä
docker exec clab-hamk-verkonhallinta-golden-client1 \
  tcpdump -i eth1 -n

# Pelkät ICMP (ping) paketit
docker exec clab-hamk-verkonhallinta-golden-client1 \
  tcpdump -i eth1 icmp -n

# TCP-portit 22 ja 80
docker exec clab-hamk-verkonhallinta-golden-client1 \
  tcpdump -i eth1 'tcp port 22 or tcp port 80' -n

# Tallenna pcap-tiedostoon
docker exec clab-hamk-verkonhallinta-golden-client1 \
  tcpdump -i eth1 -w /tmp/capture.pcap -c 100

# Analysoi Wiresharkilla (kopioi ulos)
docker cp clab-hamk-verkonhallinta-golden-client1:/tmp/capture.pcap ./

# Lue ja filtteröi tallennetusta tiedostosta
docker exec clab-hamk-verkonhallinta-golden-client1 \
  tcpdump -r /tmp/capture.pcap -n icmp
```

**Mitä opimme:**
- Mitä liikennettä kulkee
- Protokollat ja portit
- Mahdolliset ongelmat (retransmit, timeout)
- Paketit voidaan tallentaa ja analysoida myöhemmin Wiresharkilla

---

### 8. LLDP/CDP - Link Discovery (jos käytössä)

**Kerää tietoa naapurilaitteista**

```bash
# LLDP (jos lldpd asennettu)
docker exec clab-hamk-verkonhallinta-golden-r1 lldpcli show neighbors

# Näyttää:
# - Naapurilaitteet
# - Interface-parit
# - Järjestelmätiedot
```

**Huom:** Containerlab-ympäristössä LLDP ei ole oletuksena käytössä, mutta voidaan asentaa tarpeen mukaan.

---

## Dokumentaatio ja Konfiguraatiot

### 1. Topology YAML

**Virallinen lähde topologian rakenteelle**

```bash
cat ~/Verkonhallinta/topology/golden.clab.yml
```

**Sisältää:**
- Kaikki nodet ja niiden kuvat
- Kaikki linkit ja interfacet
- Verkot (mgmt-network)
- Exec-komennot (IP-konfiguraatiot)

---

### 2. IP Plan

**Suunniteltu IP-osoitejako**

```bash
cat ~/Verkonhallinta/docs/ip-plan.md
```

**Tulisi sisältää:**
- Verkko-segmentit ja CIDR-maskit
- IP-allokaatiot per laite
- Gateway-osoitteet
- VLAN-tiedot (jos käytössä)

---

### 3. FRR Konfiguraatiot

**Routereiden OSPF/BGP -konfiguraatiot**

```bash
# R1 FRR config
cat ~/Verkonhallinta/configs/frr/r1/frr.conf

# Näyttää:
# - OSPF process
# - Network statements
# - Interface costs
# - Redistribution
```

---

### 4. Ansible Inventory

**Dokumentoitu laiteluettelo**

```bash
cat ~/Verkonhallinta/configs/ansible/inventory.ini
```

**Sisältää:**
- Hostnames ja IP-osoitteet
- Ryhmät (loogiset ja fyysiset)
- Muuttujat (roolit, portit)

---

## Käytännön Esimerkit

### Esimerkki 1: Tutki yhteys Client1 → Web1

**Tavoite:** Selvitä miksi client1 ei saa yhteyttä web1-palvelimeen.

```bash
# 1. Testaa ping
docker exec clab-hamk-verkonhallinta-golden-client1 ping -c 3 10.10.20.101

# 2. Tarkista client1 reititys
docker exec clab-hamk-verkonhallinta-golden-client1 ip route

# 3. Tarkista gateway (r1) reititys
docker exec clab-hamk-verkonhallinta-golden-r1 vtysh -c "show ip route 10.10.20.0/24"

# 4. Traceroute
docker exec clab-hamk-verkonhallinta-golden-client1 traceroute 10.10.20.101

# 5. Tarkista web1 palomuurisäännöt
docker exec clab-hamk-verkonhallinta-golden-web1 iptables -L -n

# 6. Tarkista web1 SSH kuuntelee
docker exec clab-hamk-verkonhallinta-golden-web1 ss -ltn | grep :22
```

---

### Esimerkki 2: Kartoita koko labran topologia

**Tavoite:** Dokumentoi kaikki laitteet, linkit ja reitit.

```bash
# 1. Containerlab topologia
sudo containerlab inspect -t ~/Verkonhallinta/topology/golden.clab.yml

# 2. Tallenna JSON-muodossa
sudo containerlab inspect -t ~/Verkonhallinta/topology/golden.clab.yml \
  --format json > topology.json

# 3. Ansible inventory-graafi
docker exec clab-hamk-verkonhallinta-golden-ansible \
  ansible-inventory -i /ansible/inventory.ini --graph

# 4. OSPF topology jokaisesta routerista
for router in r1 r2 r3; do
  echo "=== $router OSPF neighbors ==="
  docker exec clab-hamk-verkonhallinta-golden-$router \
    vtysh -c "show ip ospf neighbor"
done

# 5. NetBox export
curl -H "Authorization: Token YOUR_TOKEN" \
  http://localhost:8000/api/dcim/devices/ | jq > netbox-devices.json
```

---

### Esimerkki 3: Troubleshoot OSPF routing

**Tavoite:** Miksi branch-office ei näy reiteissä?

```bash
# 1. Tarkista OSPF naapurit R3:ssa
docker exec clab-hamk-verkonhallinta-golden-r3 \
  vtysh -c "show ip ospf neighbor"

# 2. Tarkista OSPF interface status
docker exec clab-hamk-verkonhallinta-golden-r3 \
  vtysh -c "show ip ospf interface"

# 3. Tarkista onko branch-network advertised
docker exec clab-hamk-verkonhallinta-golden-r3 \
  vtysh -c "show running-config" | grep network

# 4. Tarkista R2 näkeekö R3:n
docker exec clab-hamk-verkonhallinta-golden-r2 \
  vtysh -c "show ip ospf neighbor"

# 5. Tarkista OSPF database
docker exec clab-hamk-verkonhallinta-golden-r2 \
  vtysh -c "show ip ospf database"

# 6. Ping test R2 → R3
docker exec clab-hamk-verkonhallinta-golden-r2 \
  ping -c 3 <r3-interface-ip>
```

---

### Esimerkki 4: Monitoring-näkymä Prometheuksesta

**Tavoite:** Visualisoi kaikki aktiiviset laitteet.

```bash
# 1. Avaa Prometheus Targets
firefox http://localhost:9090/targets

# 2. Query kaikki up-olevat targetit
curl -s 'http://localhost:9090/api/v1/query?query=up' | \
  jq -r '.data.result[] | "\(.metric.job): \(.metric.instance) = \(.value[1])"'

# 3. Näytä network interface metriikat
curl -s 'http://localhost:9090/api/v1/query?query=node_network_up' | \
  jq -r '.data.result[] | "\(.metric.instance): \(.metric.device)"'

# 4. Grafana dashboard
firefox http://localhost:3000/d/labra-observability
```

---

## Yhteenveto - Milloin käyttää mitäkin?

| Käyttötarkoitus | Työkalu | Kommentti |
|----------------|---------|-----------|
| **Nopea yleiskuva** | `containerlab inspect` | Kaikki nodet ja linkit kerralla |
| **Visuaalinen dokumentaatio** | NetBox Topology Views | Graafinen, tallennettava |
| **Logiset ryhmät** | Ansible inventory | Automaation näkökulma |
| **Operatiivinen tila** | Prometheus + Grafana | Reaaliaikainen monitoring |
| **Yhteystestaus** | `ping` | Perus saavutettavuus |
| **Reitin selvitys** | `traceroute` | Mikä reitti kuljetaan |
| **Layer 2 naapurit** | `ip neigh` / ARP | Samassa segmentissä olevat |
| **Reititys** | `ip route` / FRR show | Miten paketit reititetään |
| **OSPF/BGP tila** | FRR vtysh commands | Routing protocol debug |
| **Palvelut ja portit** | `ss -ltnp` | Mitä kuuntelee missä |
| **Liikenne-analyysi** | `tcpdump` | Pakettitason debug |
| **Konfiguraatio** | YAML/conf files | Suunniteltu rakenne |

---

## Lisäresurssit

- **Containerlab docs:** https://containerlab.dev/
- **FRR documentation:** https://docs.frrouting.org/
- **NetBox docs:** https://docs.netbox.dev/
- **Ansible inventory:** `/configs/ansible/README.md`
- **IP plan:** `/docs/ip-plan.md` (täytä tarpeen mukaan)
- **Deployment guide:** `/docs/ansible-deployment.md`

---

## Harjoitustehtäviä

1. **Kartoita OSPF-topologia:**
   - Käytä FRR-komentoja
   - Piirrä OSPF-verkko paperille
   - Tunnista DR/BDR routerit

2. **Dokumentoi IP-plan:**
   - Täytä `ip-plan.md` tiedosto
   - Käytä `ip addr` komentoja jokaisessa nodessa
   - Vertaa suunniteltuun topologiaan

3. **Testaa reititys:**
   - Ping jokaisesta hostista jokaiseen
   - Käytä traceroute:a
   - Dokumentoi havainnot

4. **NetBox-päivitys:**
   - Tarkista NetBox-topologia
   - Lisää puuttuvat kaapelit
   - Päivitä IP-osoitteet

5. **Ansible discovery:**
   - Luo playbook joka kerää:
     - IP-osoitteet
     - Reititystaulut
     - Interface-tilat
   - Tallenna raportiksi
