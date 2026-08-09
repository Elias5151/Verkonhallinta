# Viikko 6 – Zabbix ja keskitetty verkonvalvonta

## Tavoite

Tämän viikon tavoitteena on rakentaa keskitetty valvontajärjestelmä kurssin virtuaaliselle verkkoympäristölle.

Kurssin aiemmilla viikoilla olet:

- dokumentoinut verkkoympäristön
- ottanut käyttöön SNMP:n
- rakentanut Prometheus-monitoroinnin
- luonut Grafana-dashboardeja
- automatisoinut ylläpitotehtäviä Ansiblella
- analysoinut verkkoliikennettä ja lokeja

Tällä viikolla yhdistät nämä osa-alueet yhdeksi keskitetysti hallittavaksi valvontaratkaisuksi Zabbixin avulla.

---

# Oppimistavoitteet

Tehtävän jälkeen osaat:

- lisätä uusia laitteita Zabbixiin
- hyödyntää valmiita templateja
- kerätä mittareita palvelimilta
- rakentaa dashboardeja
- luoda trigger-hälytyksiä
- tunnistaa poikkeavia tilanteita
- arvioida valvontajärjestelmän hyötyjä

---

# Teoria

Yritysympäristöissä valvontajärjestelmä seuraa jatkuvasti:

- palvelimien toimintaa
- verkkolaitteiden tilaa
- resurssien käyttöä
- palveluiden saatavuutta

Hyvän valvontajärjestelmän tärkeimmät ominaisuudet ovat:

- automaattinen tiedonkeruu
- keskitetty näkymä
- historiatiedot
- hälytykset
- raportointi

Kurssilla näitä toteuttaa Zabbix.

---

# Lähtötilanne

Varmista että ympäristö on käynnissä:

```bash
bash scripts/status.sh
```

Avaa Zabbix selaimella:

```text
http://localhost:8080
```

Kirjaudu järjestelmään.

---

# Tehtävä 6.1 – Tutustu Zabbixiin

Tutki käyttöliittymän seuraavat osat:

- Hosts
- Templates
- Monitoring
- Dashboards
- Alerts
- Reports

Kirjoita raporttiin lyhyt kuvaus jokaisesta.

---

# Tehtävä 6.2 – Lisää web1 valvontaan

Lisää hostiksi:

```text
web1
```

Määritä:

- Hostname
- IP-osoite
- Host Group

Liitä vähintään yksi soveltuva template.

Esimerkiksi:

```text
Linux by Zabbix agent
```

tai

```text
Linux by SNMP
```

---

# Tehtävä 6.3 – Lisää db1 valvontaan

Lisää:

```text
db1
```

hostiksi.

Varmista että mittareita alkaa saapua.

Tarkista että vähintään seuraavat tiedot näkyvät:

- CPU
- Memory
- Uptime
- Network Traffic

---

# Tehtävä 6.4 – Lisää branch-client valvontaan

Lisää:

```text
branch-client
```

hostiksi.

Tarkista että kaikki kolme laitetta näkyvät Zabbixissa.

---

# Tehtävä 6.5 – Valvontamittarien analyysi

Valitse vähintään viisi mittaria.

Esimerkkejä:

- CPU Usage
- Memory Usage
- Load Average
- Uptime
- Disk Usage
- Network Traffic

Dokumentoi jokaisesta:

- mittarin nimi
- arvo
- mitä mittari kertoo
- miksi sitä kannattaa seurata

Täydennä taulukko:

| Mittari | Arvo | Merkitys |
|----------|----------|----------|
| | | |
| | | |
| | | |

---

# Tehtävä 6.6 – Dashboardin luominen

Luo dashboard nimellä:

```text
Golden Topology Status
```

Dashboardilla tulee näkyä vähintään:

- CPU-kuorman seuranta
- Muistinkäyttö
- Levytilan käyttö
- Verkkoliikenne
- Hostien tila

Dashboardin tulee antaa yhdellä silmäyksellä kokonaiskuva ympäristöstä.

Tallenna kuvakaappaus.

---

# Tehtävä 6.7 – Triggerien määrittäminen

Luo vähintään kaksi triggeriä.

## Triggeri 1

CPU-kuormitus:

```text
CPU > 80 %
```

## Triggeri 2

Levytila:

```text
Free disk space < 20 %
```

Dokumentoi:

- Triggerin nimi
- Ehto
- Vakavuusluokka

---

# Tehtävä 6.8 – Hälytyksen simulointi

Aiheuta hälytys.

## Vaihtoehto A

CPU-kuormitus:

```bash
yes > /dev/null
```

## Vaihtoehto B

Levytilan kulutus:

```bash
dd if=/dev/zero of=testfile.img bs=1M count=1000
```

Tarkkaile:

- syntyykö triggeri
- kuinka nopeasti hälytys ilmestyy

Ota kuvakaappaus.

---

# Tehtävä 6.9 – Häiriötilanne

Pysäytä palvelu.

Esimerkiksi:

```bash
service apache2 stop
```

tai

```bash
pkill node_exporter
```

Tarkkaile:

- näkyykö tilanne Zabbixissa
- kuinka nopeasti valvontajärjestelmä reagoi

Dokumentoi havaintosi.

---

# Tehtävä 6.10 – Kurssin työkalujen vertailu

Täydennä seuraava taulukko.

| Ominaisuus | SNMP | Prometheus | Zabbix |
|------------|------|------------|--------|
| Tiedonkeruu | | | |
| Dashboardit | | | |
| Hälytykset | | | |
| Käyttöönotto | | | |
| Skaalautuvuus | | | |
| Yrityskäyttö | | | |

---

# Tehtävä 6.11 – Pohdinta

Vastaa seuraaviin kysymyksiin:

1. Mitä hyötyä keskitetystä valvonnasta on?
2. Mitkä mittarit ovat mielestäsi tärkeimpiä?
3. Millaisista tilanteista ylläpitäjän pitäisi saada hälytys?
4. Missä tilanteissa käyttäisit Prometheusta?
5. Missä tilanteissa käyttäisit Zabbixia?
6. Mitä valvontatoimintoja lisäisit tähän ympäristöön?

---

# Raportointi

Luo tiedosto:

```text
reports/week06.md
```

Raportin tulee sisältää seuraavat osiot.

## 1. Johdanto

Mikä on Zabbix ja mihin sitä käytetään?

## 2. Hostien lisääminen

Lisätyt laitteet ja niiden valvonta.

## 3. Dashboard

Kuvakaappaus dashboardista.

## 4. Mittarit

Valitut mittarit ja niiden merkitys.

## 5. Triggerit

Määritetyt triggerit ja niiden toiminta.

## 6. Hälytys- ja häiriötestit

Suoritetut testit ja tulokset.

## 7. Vertailu

SNMP vs Prometheus vs Zabbix.

## 8. Yhteenveto

Kurssin tärkeimmät opit.

---

# Palautus

Palauta seuraavat tiedostot:

```text
reports/week06.md
```

sekä raportissa käytetyt kuvat:

```text
reports/images/
```

Esimerkki:

```text
reports/
├── week06.md
└── images/
    ├── dashboard.png
    ├── hosts.png
    ├── trigger-cpu.png
    └── alert-test.png
```

---

# Arviointikriteerit (10 p)

| Kohde | Pisteet |
|---------|---------:|
| Hostien lisääminen | 2 p |
| Dashboard | 2 p |
| Mittareiden analysointi | 2 p |
| Triggerit ja hälytykset | 2 p |
| Raportin laatu | 2 p |

## Erinomaisen suorituksen tunnusmerkit

- Kaikki hostit näkyvät valvonnassa.
- Dashboard tarjoaa kokonaiskuvan ympäristöstä.
- Triggerit toimivat oikein.
- Häiriötilanteet tunnistetaan onnistuneesti.
- Raportissa yhdistetään kurssin eri osa-alueet yhdeksi kokonaisuudeksi.