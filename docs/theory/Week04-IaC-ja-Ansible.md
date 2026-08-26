# Infrastructure as Code ja Ansible

## Johdanto

Kurssin aikaisemmilla viikoilla palvelimia hallittiin pääasiassa käsin:

- SNMP asennettiin erikseen jokaiselle koneelle
- Node Exporter käynnistettiin käsin
- asetustiedostoja muokattiin SSH-yhteyden kautta

Tällainen toimintamalli toimii pienissä ympäristöissä, mutta muuttuu nopeasti hankalaksi ympäristön kasvaessa.

Kuvitellaan ympäristö, jossa ylläpidetään:

- 10 palvelinta
- 50 palvelinta
- 500 palvelinta

Tällöin samojen komentojen suorittaminen yksitellen ei ole enää tehokasta eikä virheetöntä.

Ratkaisuna käytetään Infrastructure as Code -ajattelua.

---

# Mitä Infrastructure as Code tarkoittaa?

Infrastructure as Code (IaC) tarkoittaa infrastruktuurin hallintaa ohjelmakoodin avulla.

Perinteinen toimintamalli:

```text
Ylläpitäjä
    │
    ▼
SSH palvelimelle
    │
    ▼
Suorita komennot käsin
```

IaC-malli:

```text
Koodi
    │
    ▼
Automaatiotyökalu
    │
    ▼
Palvelimet
```

Ylläpitäjä ei hallitse yksittäisiä palvelimia vaan niiden tavoitetilaa.

---

# Miksi Infrastructure as Code?

## Toistettavuus

Sama määritys tuottaa saman lopputuloksen.

```text
Palvelin rikkoutuu
        │
        ▼
Suorita automaatio
        │
        ▼
Uusi samanlainen palvelin
```

Kun ympäristö rakennetaan koodista, se voidaan luoda uudelleen milloin tahansa.

---

## Dokumentaatio

Automaatiokoodi toimii samalla dokumentaationa.

Esimerkki:

```yaml
name: nginx
state: present
```

Pelkästään määritystä lukemalla voidaan nähdä, että järjestelmään kuuluu nginx-palvelu.

---

## Muutosten hallinta

IaC-määritykset tallennetaan yleensä versionhallintaan.

```bash
git add .
git commit -m "Added nginx deployment"
git push
```

Kaikki muutokset jäävät talteen ja niitä voidaan tarkastella myöhemmin.

---

## Skaalautuvuus

Sama määritys voidaan suorittaa:

- yhdelle palvelimelle
- kymmenelle palvelimelle
- sadalle palvelimelle
- tuhannelle palvelimelle

ilman että ylläpitäjän työmäärä kasvaa samassa suhteessa.

---

# Mitä Ansible on?

Ansible on automaatiotyökalu, jolla voidaan:

- asentaa ohjelmistoja
- hallita käyttöjärjestelmiä
- tehdä asetuksia
- kerätä tietoja palvelimista
- ylläpitää ympäristöjä

Ansible kuuluu Configuration Management -työkaluihin.

Sen tärkein tehtävä on pitää palvelimet halutussa tavoitetilassa.

---

# Miten Ansible toimii?

Ansible käyttää kahta pääroolia:

- **Control Node**
- **Managed Host**

```text
              Control Node
                    │
                    │ SSH
                    │
      ┌─────────────┼─────────────┐
      │             │             │
      ▼             ▼             ▼

    web1          db1         client1
```

Ylläpitäjä suorittaa Ansible-komennot hallintapalvelimelta.

Ansible muodostaa SSH-yhteydet hallittaviin kohteisiin ja suorittaa tarvittavat tehtävät.

---

# Agentiton arkkitehtuuri

Monet hallintajärjestelmät vaativat erillisen agentin jokaiselle palvelimelle.

```text
Hallintapalvelin
       │
       ▼
 Agentti palvelimessa
```

Ansible toimii yleensä ilman erillisiä agentteja.

Hallinta tapahtuu SSH-yhteyden avulla.

Tämä vähentää:

- ylläpidettävien ohjelmien määrää
- resurssikulutusta
- ympäristön monimutkaisuutta

Linux-kohteissa tarvitaan kuitenkin toimiva SSH-yhteys sekä tavallisesti Python-ajoympäristö moduulien suorittamista varten.

---

# Ansible-ympäristön osat

## Control Node

Kone, jossa Ansible suoritetaan.

Täältä käynnistetään esimerkiksi:

```bash
ansible
ansible-playbook
```

---

## Managed Host

Hallittava kohde.

Esimerkkejä:

```text
web1
db1
branch-client
```

---

## Inventory

Inventory sisältää tiedot hallittavista kohteista.

Kurssiympäristössä inventory löytyy tiedostosta:

```text
configs/inventory.ini
```

Inventory kertoo Ansiblelle:

- mitä kohteita hallitaan
- mihin ryhmään ne kuuluvat
- miten niihin yhdistetään

Inventoryn rakennetta voidaan tarkastella komennolla:

```bash
ansible-inventory \
  -i configs/inventory.ini \
  --graph
```

Tai täydellisenä JSON-rakenteena:

```bash
ansible-inventory \
  -i configs/inventory.ini \
  --list
```

---

# Miksi ryhmät ovat tärkeitä?

Kaikki palvelimet eivät ole samanlaisia.

Ympäristössä voi olla esimerkiksi:

- web-palvelimia
- tietokantapalvelimia
- monitorointipalvelimia
- työasemia

Ryhmien avulla voidaan kohdistaa määritykset tietylle palvelinryhmälle.

Esimerkiksi:

```yaml
hosts: webservers
```

soveltaa tehtävät vain web-palvelimille.

---

# YAML-perusteet

Ansible-playbookit kirjoitetaan YAML-muodossa.

YAML käyttää sisennyksiä rakenteen kuvaamiseen.

Esimerkki listasta:

```yaml
packages:
  - nginx
  - curl
  - git
```

Esimerkki sanakirjasta:

```yaml
service:
  name: nginx
  state: started
```

Tärkeät säännöt:

- käytä välilyöntejä, älä tabulaattoreita
- käytä johdonmukaista sisennystä
- kaksoispisteen jälkeen tulee välilyönti
- listan alkio alkaa merkillä `-`

Hyvin suuri osa aloittelijoiden Ansible-virheistä johtuu YAML-syntaksista.

---

# Mitä Playbook tarkoittaa?

Playbook kuvaa ympäristön tavoitetilan.

Esimerkki:

```yaml
---
- name: Configure web servers
  hosts: webservers
  become: true

  tasks:

    - name: Ensure nginx is installed
      ansible.builtin.apt:
        name: nginx
        state: present
        update_cache: true

    - name: Ensure nginx is running
      ansible.builtin.service:
        name: nginx
        enabled: true
        state: started
```

Playbook ei kuvaa vain yksittäisiä komentoja.

Se kuvaa minkälaisessa tilassa ympäristön halutaan olevan.

---

# Playbook rivi riviltä

```yaml
- name: Configure web servers
```

Playbookin kuvaus.

```yaml
hosts: webservers
```

Määrittää kohderyhmän inventoryssa.

```yaml
become: true
```

Käyttää sudo-oikeuksia tehtävien suorittamiseen.

```yaml
tasks:
```

Tehtävälista.

```yaml
ansible.builtin.apt
```

Pakettien hallintamoduuli.

```yaml
state: present
```

Varmistaa, että paketti on asennettuna.

```yaml
ansible.builtin.service
```

Palveluiden hallintamoduuli.

```yaml
state: started
```

Varmistaa, että palvelu on käynnissä.

---

# Mitä moduuli tarkoittaa?

Moduulit ovat Ansible-toiminnallisuuden rakennuspalikoita.

Yleisimmät moduulit:

```yaml
ansible.builtin.apt
```

Pakettien hallinta.

```yaml
ansible.builtin.service
```

Palveluiden hallinta.

```yaml
ansible.builtin.file
```

Tiedostojen ja hakemistojen hallinta.

```yaml
ansible.builtin.copy
```

Tiedostojen kopiointi.

```yaml
ansible.builtin.template
```

Mallipohjien käsittely.

---

# Ensimmäinen yhteystesti

Ansible-yhteyksien toiminta voidaan testata ping-moduulilla.

```bash
ansible all \
  -i configs/inventory.ini \
  -m ansible.builtin.ping
```

Huomaa, että tämä ei lähetä ICMP-ping-paketteja.

Komento testaa, pystyykö Ansible:

1. muodostamaan yhteyden kohteeseen
2. suorittamaan moduulin
3. vastaanottamaan vastauksen

Mahdollisia tuloksia:

- `SUCCESS`
- `UNREACHABLE`
- `FAILED`

---

# Ad-hoc-komennot

Yksittäisiä komentoja voidaan suorittaa myös ilman playbookia.

Esimerkki:

```bash
ansible all \
  -i configs/inventory.ini \
  -m ansible.builtin.command \
  -a "uptime"
```

Tai:

```bash
ansible all \
  -i configs/inventory.ini \
  -m ansible.builtin.command \
  -a "df -h"
```

Ad-hoc-komennot soveltuvat testaukseen ja vianetsintään.

Varsinaiset ympäristön määritykset kannattaa toteuttaa playbookeilla.

---

# Deklaratiivinen ajattelu

Ansible tukee tavoitetilaan perustuvaa hallintaa.

Esimerkki:

```yaml
ansible.builtin.service:
  name: nginx
  enabled: true
  state: started
```

Ylläpitäjän ei tarvitse määrittää kaikkia yksittäisiä vaiheita.

Riittää, että määritellään haluttu lopputulos.

Ansible selvittää tarvittavat muutokset tavoitetilan saavuttamiseksi.

---

# Idempotenssi

Yksi Ansible-maailman tärkeimmistä käsitteistä on idempotenssi.

Sama playbook voidaan suorittaa useita kertoja.

```text
1. ajo → muutoksia tehdään
2. ajo → ei muutoksia
3. ajo → ei muutoksia
```

Lopputulos säilyy samana.

Esimerkki:

```bash
ansible-playbook \
  -i configs/inventory.ini \
  playbook.yml
```

Ensimmäisen ajon jälkeen voidaan suorittaa sama playbook uudelleen.

Tavoitteena on, ettei toisella ajolla tehdä tarpeettomia muutoksia.

---

# Ansible Facts

Ansible pystyy keräämään tietoja hallittavista kohteista.

Näitä tietoja kutsutaan nimellä Facts.

Esimerkkejä:

- käyttöjärjestelmä
- IP-osoitteet
- verkkoliitännät
- prosessorit
- keskusmuisti

Esimerkki:

```bash
ansible all \
  -i configs/inventory.ini \
  -m ansible.builtin.setup \
  -a "filter=ansible_default_ipv4"
```

Facts-tietoja voidaan käyttää:

- dokumentointiin
- raportointiin
- automaatioon
- päätöksentekoon

---

# Ympäristön tarkistaminen

Kurssiympäristö sisältää valmiita työkaluja Ansible-harjoituksia varten.

Tutustu ainakin seuraaviin tiedostoihin:

```text
configs/
├── inventory.ini
├── ansible-bootstrap.sh
├── ssh-setup.sh
├── test-quick.sh
├── ansible/
└── playbooks/
```

Ympäristön toiminta voidaan tarkistaa:

```bash
cd configs
./test-quick.sh
```

Lisätiedot käyttöönotosta löytyvät kurssin deployment guide -materiaalista.

---

# Syntaksin tarkistaminen

Playbook kannattaa tarkistaa ennen ajoa.

```bash
ansible-playbook \
  -i configs/inventory.ini \
  playbook.yml \
  --syntax-check
```

Syntaksitarkistus löytää esimerkiksi:

- YAML-virheitä
- puuttuvia osioita
- rakenteellisia ongelmia

---

# Muutosten esikatselu

Playbook voidaan mahdollisuuksien mukaan suorittaa myös check modessa.

```bash
ansible-playbook \
  -i configs/inventory.ini \
  playbook.yml \
  --check
```

Näytä erot:

```bash
ansible-playbook \
  -i configs/inventory.ini \
  playbook.yml \
  --check \
  --diff
```

Check mode antaa arvion tulevista muutoksista ilman varsinaista muutosten tekemistä.

---

# Yleinen vianetsintä

Tarkista yhteydet:

```bash
ansible all \
  -i configs/inventory.ini \
  -m ansible.builtin.ping
```

Tarkista syntaksi:

```bash
ansible-playbook \
  -i configs/inventory.ini \
  playbook.yml \
  --syntax-check
```

Näytä tarkempi lokitus:

```bash
ansible-playbook \
  -i configs/inventory.ini \
  playbook.yml \
  -vvv
```

Yleisimmät virhetyypit:

| Tulos | Merkitys |
|---------|---------|
| SUCCESS | Tehtävä onnistui |
| UNREACHABLE | SSH-yhteys epäonnistui |
| FAILED | Tehtävän suoritus epäonnistui |

---

# Ansible osana kurssin kokonaisuutta

Kurssin aiemmat viikot käsittelivät monitorointia:

- SNMP
- Prometheus
- Grafana

Ansible liittyy automaatioon.

```text
Ansible
   │
   └── Rakentaa ympäristön

Prometheus
   │
   └── Kerää mittarit

Grafana
   │
   └── Visualisoi ympäristön
```

---

# Ansible osana DevOps-ajattelua

Modernissa ympäristössä infrastruktuuri, määritykset ja sovellukset ovat versionhallittua koodia.

Tyypillinen kokonaisuus:

```text
Git
 │
 ▼
Versionhallinta
 │
 ▼
CI/CD
 │
 ▼
Ansible
 │
 ▼
Palvelimet
 │
 ▼
Prometheus
 │
 ▼
Grafana
```

Työkalujen roolit:

| Työkalu | Tarkoitus |
|----------|------------|
| Git | Versionhallinta |
| Ansible | Palvelinten hallinta |
| Prometheus | Mittarien keruu |
| Grafana | Visualisointi |
| CI/CD | Automaattiset työnkulut |

---

# Yhteenveto

Tämän materiaalin tärkeimmät opit ovat:

- Infrastructure as Code tarkoittaa infrastruktuurin hallintaa ohjelmakoodin avulla.
- Ansible on yksi yleisimmistä palvelinympäristöjen automaatiotyökaluista.
- Inventory määrittelee hallittavat kohteet.
- Playbookit kuvaavat ympäristön tavoitetilan.
- Moduulit toteuttavat varsinaiset tehtävät.
- YAML on Ansible-määritysten tiedostomuoto.
- Ansible hyödyntää SSH-yhteyksiä hallittaviin kohteisiin.
- Idempotenssi mahdollistaa playbookien turvallisen uudelleensuorittamisen.
- Facts mahdollistavat ympäristön automaattisen havainnoinnin.
- Ansible muodostaa sillan manuaalisen ylläpidon ja modernin DevOps-ajattelun välille.

```text
Käsin hallinta
        ↓
     Ansible
        ↓
   Automaatio
        ↓
     DevOps
```
