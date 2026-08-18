# Viikko 1: Verkon dokumentointi

## 1. Miksi verkkoa dokumentoidaan?

### Tavoitteet

Opiskelija ymmärtää:

- miksi dokumentaatio on osa verkonhallintaa
- mitä riskejä puutteellinen dokumentaatio aiheuttaa
- kuinka dokumentaatio liittyy monitorointiin, automaatioon ja häiriönhallintaan

### Sisältö

- Dokumentaation merkitys verkon elinkaaressa
- Dokumentaation vaikutus ylläpitokustannuksiin
- Dokumentaation rooli häiriötilanteissa
- Dokumentaatio osana tietoturvaa

### Esimerkit

- uusi ylläpitäjä aloittaa työssä
- verkkovika tapahtuu klo 02:00
- palvelin vaihdetaan uuteen

### Lähteet

- https://www.ciscopress.com/
- https://www.rfc-editor.org/

---
## Dokumentaation merkitys verkon elinkaaressa

Verkon dokumentaatio ei ole vain käyttöönoton yhteydessä laadittava kuvaus verkosta, vaan se on jatkuvasti ylläpidettävä osa verkon elinkaarta. Dokumentaatio tukee verkon suunnittelua, käyttöönottoa, ylläpitoa, kehittämistä sekä mahdollisia käyttöiän lopun muutoksia tai korvaamista.

Hyvin ylläpidetty dokumentaatio auttaa ylläpitäjiä ymmärtämään verkon rakennetta, toimintaa ja riippuvuussuhteita. Samalla se vähentää henkilösidonnaista tietoa ja mahdollistaa verkon hallinnan myös tilanteissa, joissa alkuperäiset suunnittelijat eivät enää työskentele organisaatiossa.

### Verkon elinkaaren vaiheet

#### 1. Suunnittelu

Verkon elinkaari alkaa suunnitteluvaiheesta.

Suunnittelun aikana dokumentoidaan esimerkiksi:

- verkkovaatimukset
- kapasiteettitavoitteet
- osoitesuunnitelma
- fyysinen topologia
- looginen topologia
- tietoturvavaatimukset
- laitevalinnat

Hyvin laadittu suunnitteludokumentaatio toimii myöhemmin käyttöönoton ja ylläpidon perustana.

---

#### 2. Käyttöönotto

Kun verkko rakennetaan käyttöön, dokumentaatiota täydennetään toteutuneilla tiedoilla.

Dokumentoitavia asioita ovat esimerkiksi:

- käytetyt IP-osoitteet
- VLAN-rakenteet
- reititysmääritykset
- laitteiden sijainnit
- palveluiden konfiguraatiot

Tässä vaiheessa dokumentaation ja todellisen ympäristön tulee vastata toisiaan mahdollisimman tarkasti.

---

#### 3. Ylläpito

Suurin osa verkon elinkaaresta koostuu ylläpitovaiheesta.

Ylläpidon aikana dokumentaatiota käytetään päivittäin:

- vianetsinnässä
- muutostöissä
- kapasiteetin suunnittelussa
- tietoturvatarkastuksissa
- laitteiden päivityksissä

Mitä pidempään verkko on käytössä, sitä tärkeämpää on pitää dokumentaatio ajan tasalla.

Päivittämätön dokumentaatio voi johtaa tilanteeseen, jossa ylläpitäjät eivät enää tiedä:

- mitä laitteita verkossa on
- miten ne on yhdistetty
- mitä palveluja ne tarjoavat
- mitä vaikutuksia muutoksilla on

---

#### 4. Kehittäminen

Verkot eivät pysy muuttumattomina.

Organisaation kasvu, uudet palvelut ja muuttuvat liiketoiminnan tarpeet edellyttävät jatkuvaa kehittämistä.

Dokumentaatiota tarvitaan esimerkiksi:

- uusien palveluiden suunnittelussa
- kapasiteetin kasvattamisessa
- uusien toimipisteiden liittämisessä
- pilvipalveluiden käyttöönotossa
- automaation rakentamisessa

Ajantasainen dokumentaatio mahdollistaa kehitystyön tekemisen hallitusti ja ennakoitavasti.

---

#### 5. Korvaaminen ja käytöstä poisto

Jossain vaiheessa laitteet ja palvelut poistuvat käytöstä.

Dokumentaation avulla voidaan:

- tunnistaa poistettavat järjestelmät
- arvioida muutosten vaikutukset
- varmistaa palveluiden jatkuvuus
- säilyttää tarvittavat historiatiedot

Ilman dokumentaatiota voi olla vaikeaa tunnistaa mitä vaikutuksia yksittäisen laitteen tai palvelun poistolla on koko verkkoon.

---

### Dokumentaatio osana jatkuvaa ylläpitoprosessia

Verkon dokumentaatiota ei tulisi ajatella projektin lopuksi kirjoitettavana raporttina.

Nykyaikaisessa verkonhallinnassa dokumentaatio on osa päivittäistä ylläpitotyötä.

Jokaisen muutoksen yhteydessä tulee päivittää myös dokumentaatio.

## Dokumentaation vaikutus ylläpitokustannuksiin

Verkon ylläpidon kustannukset eivät muodostu pelkästään laitteista, ohjelmistoista tai lisensseistä. Merkittävä osa kustannuksista liittyy ylläpitäjien työaikaan, vianetsintään, muutostöihin ja häiriöiden vaikutuksiin organisaation toimintaan.

Laadukas dokumentaatio on yksi tehokkaimmista tavoista pienentää verkon elinkaaren aikaisia ylläpitokustannuksia.

### Vianetsinnän nopeutuminen

Yksi dokumentaation suurimmista hyödyistä liittyy häiriötilanteisiin.

Kun ylläpitäjällä on käytettävissään:

- ajantasainen verkkokaavio
- laiteluettelot
- IP-osoitteet
- palveluiden riippuvuudet
- yhteystiedot

voidaan ongelman syy paikallistaa huomattavasti nopeammin.

Esimerkiksi verkkokatkon aikana ylläpitäjä pystyy nopeasti selvittämään:

- mitä laitteita yhteys koskee
- mitä reitityspolkua liikenne käyttää
- missä laite fyysisesti sijaitsee
- kuka vastaa kyseisestä järjestelmästä

Ilman dokumentaatiota sama työ joudutaan usein tekemään selvitystyönä häiriötilanteen aikana.

---

### Muutostöiden riskien pienentäminen

Verkkoympäristöihin tehdään jatkuvasti muutoksia.

Esimerkiksi:

- uusia palvelimia otetaan käyttöön
- VLAN-rakenteita muutetaan
- palomuurisääntöjä päivitetään
- verkkolaitteita vaihdetaan

Jos ylläpitäjät eivät tunne ympäristön rakennetta, muutoksiin liittyvä riski kasvaa merkittävästi.

Dokumentaatio auttaa tunnistamaan:

- mitä palveluita muutos koskee
- mitä riippuvuuksia järjestelmillä on
- missä mahdolliset riskit sijaitsevat
- kuinka muutoksen vaikutukset voidaan arvioida etukäteen

Tämä vähentää virheiden määrää sekä suunnittelemattomia käyttökatkoja.

---

### Henkilösidonnaisen tiedon vähentäminen

Yksi yleisimmistä ongelmista IT-ympäristöissä on niin sanottu "hiljainen tieto".

Esimerkiksi:

> "Tämän verkon toiminta tunnetaan vain yhden ylläpitäjän päässä."

Jos kyseinen henkilö vaihtaa työpaikkaa tai on poissa työstä, verkon ylläpidosta voi tulla huomattavasti vaikeampaa.

Hyvä dokumentaatio siirtää tiedon ihmisiltä organisaation omistamaksi tiedoksi.

Tämän ansiosta:

- uusien ylläpitäjien perehdytys nopeutuu
- sijaisuudet helpottuvat
- verkon ylläpito ei ole yhden henkilön varassa

---

### Automatisoinnin mahdollistaminen

Nykyaikainen verkonhallinta perustuu usein automaatioon.

Esimerkiksi:

- Ansible
- NetBox
- Prometheus
- Zabbix
- GitHub

hyödyntävät kaikki jollain tavalla dokumentoitua tietoa ympäristöstä.

Jos laitteiden tiedot, IP-osoitteet ja roolit ovat dokumentoituina yhdessä paikassa, voidaan niistä muodostaa automaattisesti:

- inventaariot
- monitorointikohteet
- konfiguraatiot
- raportit

Automaation avulla vähennetään manuaalisen työn määrää, mikä näkyy suoraan ylläpitokustannusten pienentymisenä.

---

### Kapasiteetin suunnittelun helpottuminen

Dokumentaation yhteydessä ylläpidetään usein myös verkon suorituskykyyn liittyvää baseline-tietoa.

Tämän avulla voidaan seurata esimerkiksi:

- liikennemääriä
- prosessorikuormaa
- muistinkäyttöä
- levytilan käyttöä

Pitkän aikavälin mittaustiedon perusteella voidaan havaita kapasiteetin kasvutarpeet ennen kuin ne aiheuttavat häiriöitä.

Tällöin laajennukset voidaan toteuttaa suunnitellusti eikä kiireellisenä korjaustoimenpiteenä.

---

### Esimerkkitapaus

Kuvitellaan organisaatio, jossa verkkovika aiheuttaa käyttäjille palvelukatkon.

#### Hyvin dokumentoitu ympäristö

```text
Hälytys
    ↓
Ongelman sijainti tunnistetaan
    ↓
Laitteen yhteystiedot löytyvät
    ↓
Vika korjataan
    ↓
Katko kestää 15 minuuttia
```

#### Puutteellisesti dokumentoitu ympäristö

```text
Hälytys
    ↓
Etsitään vastuuhenkilö
    ↓
Selvitetään laitesijainti
    ↓
Selvitetään yhteydet
    ↓
Vika korjataan
    ↓
Katko kestää 2 tuntia
```

Tekninen vika voi olla molemmissa tilanteissa täsmälleen sama, mutta dokumentaation laatu vaikuttaa merkittävästi korjausaikaan ja siten myös kustannuksiin.

---

## Dokumentaatio investointina

Dokumentoinnin laatiminen vaatii aikaa ja resursseja, minkä vuoksi sitä saatetaan joskus pitää pelkkänä lisätyönä.

Todellisuudessa dokumentaatio on investointi, joka maksaa itsensä takaisin:

- nopeampana vianetsintänä
- pienempinä käyttökatkoina
- tehokkaampina muutostöinä
- parempana tietoturvana
- helpompana automaation käyttöönottona
- pienempänä henkilöriskinä

Hyvin dokumentoidun verkon ylläpitäminen on lähes aina edullisempaa kuin ympäristön, jonka rakenteesta ja toiminnasta ei ole ajantasaista dokumentaatiota.

### Lisälukemista

- Cisco Design Zone  
  https://www.cisco.com/c/en/us/solutions/design-zone.html

- NetBox Documentation  
  https://netboxlabs.com/docs/netbox/

- Network to Code Blog  
  https://networktocode.com/blog/

- ITIL 4 Foundation: Service Management Practices

- RFC 3535: Overview of Network Management  
  https://www.rfc-editor.org/rfc/rfc3535

## Dokumentaation rooli häiriötilanteissa

Tietoverkkojen häiriönhallinnan tavoitteena on palauttaa palveluiden normaali toiminta mahdollisimman nopeasti sekä minimoida liiketoiminnalle aiheutuvat vaikutukset. Jotta tämä olisi mahdollista, häiriöistä on ylläpidettävä tietoja ja tapahtumat on dokumentoitava järjestelmällisesti. Incident Management -käytännöt korostavat häiriöiden kirjaamista, niiden tilan seurantaa sekä historiatiedon ylläpitämistä myöhempää analyysia varten. 【1-6e986e】【2-8c9cc7】

### Häiriön paikantaminen

Kun käyttäjä ilmoittaa ongelmasta, ylläpitäjän on kyettävä nopeasti tunnistamaan:

- mitä palvelua häiriö koskee
- missä laitteessa ongelma esiintyy
- mitä verkkoyhteyksiä palvelu käyttää
- mitä muita järjestelmiä häiriö voi koskettaa

Ajantasainen verkkotopologia, laiteluettelo ja IP-osoitedokumentaatio nopeuttavat ongelman rajaamista ja vähentävät vianetsintään käytettävää aikaa. 【1-6e986e】【3-7e428a】

### Riippuvuuksien tunnistaminen

Nykyaikaiset palvelut muodostuvat useista toisiinsa liittyvistä järjestelmistä. Häiriön vaikutuksia voidaan arvioida vain, jos järjestelmien väliset riippuvuudet tunnetaan ja on dokumentoitu.

Esimerkiksi:

```text
Käyttäjä
    ↓
DNS-palvelu
    ↓
Kuormantasaaja
    ↓
Sovelluspalvelin
    ↓
Tietokanta
```

Jos jokin ketjun osa epäonnistuu, käyttäjä kokee usein koko palvelun olevan poissa käytöstä. Dokumentaation avulla voidaan tunnistaa palveluiden väliset riippuvuudet, arvioida vaikutuksia sekä priorisoida korjaustoimenpiteitä. 【1-6e986e】【2-8c9cc7】

### Muutosten vaikutusten arviointi

Häiriötilanteessa saatetaan joutua tekemään korjaavia muutoksia.

Esimerkiksi:

- verkkoliitäntä poistetaan käytöstä
- palvelu käynnistetään uudelleen
- reititys muutetaan varareitille
- palvelu siirretään toiselle palvelimelle

Dokumentaation avulla voidaan arvioida etukäteen, mitä muita järjestelmiä muutos koskee ja kuinka laajalle sen vaikutukset voivat ulottua. 【1-6e986e】【3-7e428a】

### Häiriön jälkianalyysi

Kun ongelma on ratkaistu, tulisi selvittää myös häiriön juurisyy (Root Cause Analysis).

Dokumentaation avulla voidaan vertailla:

- nykyistä rakennetta
- aikaisempia muutoksia
- verkkotopologioita
- konfiguraatiotietoja
- historiatietoja

Näin voidaan tunnistaa häiriön todellinen syy ja estää vastaavan tilanteen toistuminen tulevaisuudessa. 【4-9942ee】【5-db0bdc】

### Yhteenveto

Verkkodokumentaation merkitys häiriönhallinnassa voidaan tiivistää seuraavasti:

```text
Häiriö havaitaan
        ↓
Dokumentaatio auttaa paikantamaan vian
        ↓
Vaikutukset tunnistetaan
        ↓
Korjaustoimet suoritetaan
        ↓
Juurisyy analysoidaan
        ↓
Dokumentaatiota päivitetään
```

Hyvä dokumentaatio lyhentää käyttökatkojen kestoa, vähentää virheellisten korjaustoimenpiteiden riskiä sekä nopeuttaa verkon palauttamista normaaliin toimintaan. 【1-6e986e】【2-8c9cc7】

### Lähteet

- ITIL Incident Management Overview  
  https://www.manageengine.com/products/service-desk/it-incident-management/what-is-it-incident-management.html

- IT Process Wiki: Incident Management  
  https://wiki.en.it-processmaps.com/index.php/Incident_Management

- RFC 3535: Overview of the 2002 IAB Network Management Workshop  
  https://datatracker.ietf.org/doc/html/rfc3535

---

# Dokumentaatio osana tietoturvaa

Tietoturvan yksi keskeisimmistä periaatteista on näkyvyys ympäristöön. Organisaation on tiedettävä mitä laitteita, palveluita, ohjelmistoja ja verkkoyhteyksiä sen ympäristö sisältää. Ilman tätä tietoa ympäristön suojaaminen on käytännössä mahdotonta. NIST korostaa, että tehokas omaisuudenhallinta (IT Asset Management) parantaa näkyvyyttä järjestelmiin ja siten myös organisaation tietoturvaa. 【6-85767a】【7-a4ad71】

### Näkyvyys verkkoon

Ylläpidon tulisi pystyä vastaamaan vähintään seuraaviin kysymyksiin:

- Mitä laitteita verkossa on?
- Missä ne sijaitsevat?
- Mitä käyttöjärjestelmiä ne käyttävät?
- Kuka vastaa niiden ylläpidosta?
- Mitä palveluita ne tarjoavat?

Jos laite tai palvelu ei ole dokumentoitu, sitä ei välttämättä myöskään päivitetä, valvota tai suojata asianmukaisesti. 【6-85767a】【8-394191】

### Omaisuuden hallinta (Asset Management)

Tietoturvatyön perustana on ajantasainen inventaario.

Tyypillisesti dokumentoidaan:

- laitteet
- ohjelmistot
- käyttöjärjestelmät
- IP-osoitteet
- verkkosegmentit
- vastuuhenkilöt

NIST:n mukaan tehokas omaisuudenhallinta parantaa näkyvyyttä ympäristöön, auttaa tunnistamaan haavoittuvat järjestelmät ja nopeuttaa reagointia tietoturvapoikkeamiin. 【7-a4ad71】【6-85767a】

### Muutosten hallinta

Merkittävä osa tietoturvaongelmista syntyy virheellisten muutosten seurauksena.

Esimerkkejä:

- liian salliva palomuurisääntö
- väärä VLAN-konfiguraatio
- tarpeettomasti avoin palveluportti
- virheellinen reitityssääntö

Versionhallittu dokumentaatio mahdollistaa sen, että voidaan jälkikäteen selvittää:

- mitä muutettiin
- kuka muutoksen teki
- milloin muutos tehtiin
- miksi muutos tehtiin

Tämä on tärkeää sekä tietoturvapoikkeamien tutkinnassa että auditoinneissa. 【5-db0bdc】【9-1046e0】

### Poikkeamien tunnistaminen

Ajantasainen dokumentaatio muodostaa kuvan verkon normaalista tilasta.

Kun tiedetään miltä ympäristön pitäisi näyttää, voidaan helpommin havaita esimerkiksi:

- tuntematon verkkolaite
- ylimääräinen verkkoyhteys
- uusi avoin palvelu
- odottamaton IP-osoite

Poikkeamien tunnistaminen on keskeinen osa sekä tietoturvavalvontaa että riskienhallintaa. 【8-394191】【10-d71666】

### Dokumentaatio ja vaatimustenmukaisuus

Monet tietoturvastandardit ja sääntelykehykset edellyttävät dokumentoitua tietoa organisaation järjestelmistä.

Esimerkkejä:

- ISO 27001
- NIS2
- NIST Cybersecurity Framework

Näissä korostuvat erityisesti:

- omaisuuden tunnistaminen
- muutosten hallinta
- vastuiden määrittely
- riskienhallinta

Dokumentaatio toimii tärkeänä todistusaineistona auditoinneissa ja tietoturvatarkastuksissa. 【9-1046e0】【10-d71666】

### Yhteenveto

Tietoturvan näkökulmasta dokumentaatio auttaa vastaamaan neljään keskeiseen kysymykseen:

```text
Mitä verkossa on?
        ↓
Missä se sijaitsee?
        ↓
Kuka siitä vastaa?
        ↓
Miten se on suojattu?
```

Jos näihin kysymyksiin ei pystytä vastaamaan luotettavasti, on myös verkon tietoturvaa vaikea hallita tehokkaasti. 【6-85767a】【9-1046e0】

### Lähteet

- NIST SP 1800-5 IT Asset Management  
  https://csrc.nist.gov/pubs/sp/1800/5/final

- NIST Cybersecurity Framework 2.0  
  https://www.nist.gov/cyberframework

- NIST NCCoE Asset Management  
  https://www.nccoe.nist.gov/projects/building-blocks/asset-management

- RFC 3535: Overview of the 2002 IAB Network Management Workshop  
  https://datatracker.ietf.org/doc/html/rfc3535


# 2. Verkon topologiat

## Fyysinen topologia

Fyysinen topologia kuvaa tietoverkon todellista rakennetta. Se esittää verkkolaitteiden fyysiset sijainnit sekä niiden väliset fyysiset yhteydet. Fyysinen topologia vastaa kysymykseen:

> Missä laitteet sijaitsevat ja miten ne on yhdistetty toisiinsa?

Verkonhallinnan näkökulmasta fyysinen topologia on tärkeä, koska häiriötilanteissa ongelma liittyy usein fyysiseen infrastruktuuriin, kuten kaapelointiin, verkkolaitteeseen, kuituyhteyteen tai sähkönsyöttöön.

RFC 8345 määrittelee verkon topologian koostuvan solmuista (nodes) ja niiden välisistä yhteyksistä (links). Fyysinen topologia voidaan nähdä tämän mallin konkreettisena toteutuksena, jossa solmut ovat todellisia verkkolaitteita ja yhteydet fyysisiä kaapeleita tai kuituyhteyksiä. 【1-ecd2d3】【2-c34ec1】

---

## Laitteiden sijainti

Verkkolaitteiden fyysinen sijainti tulee dokumentoida mahdollisimman tarkasti.

Tyypillisesti dokumentoitavia tietoja ovat:

- rakennus
- kerros
- huone
- laiteteline (rack)
- laitepaikka telineessä

Esimerkki:

```text
Core-SW1
Rakennus A
Konesali 1
Räkki R03
U-paikka 18
```

Laitteen sijaintitiedot helpottavat huolto- ja vikakorjaustoimenpiteitä erityisesti suurissa ympäristöissä, joissa laitteita voi olla useissa rakennuksissa tai konesaleissa. 【1-ecd2d3】

---

## Kaapeloinnit

Fyysiseen topologiaan kuuluu tieto siitä, miten laitteet on yhdistetty toisiinsa.

Dokumentoitavia asioita ovat esimerkiksi:

- kuparikaapelit
- valokuitukaapelit
- patch-kaapelit
- nousukaapeloinnit
- rakennusten väliset yhteydet

Dokumentaatiossa tulisi näkyä:

```text
SW1 Gi0/1
        │
 Cat6A
        │
SW2 Gi0/24
```

Kaapelointitiedot mahdollistavat vikojen nopean paikallistamisen ja helpottavat muutostöiden suunnittelua.

---

## Ristikytkennät

Ristikytkennällä tarkoitetaan kaapelointijärjestelmän kohtaa, jossa yhteyksiä voidaan yhdistää, muuttaa tai siirtää ilman varsinaisen kiinteän kaapeloinnin muuttamista.

Tyypillisiä ristikytkentäpaikkoja ovat:

- tietoliikennekaapit
- kerrosjakamot
- rakennusjakamot
- konesalien patch-paneelit

Esimerkki:

```text
Työpiste 101
      ↓
Patch-paneeli PP-01
      ↓
Kytkin SW1 portti Gi0/12
```

Dokumentaation tulee kertoa, mihin porttiin kukin yhteys päätyy. Tämä vähentää virhekytkentöjä ja nopeuttaa ongelmien selvittämistä.

---

## Konesalit

Fyysisessä topologiassa konesalit muodostavat usein verkon keskeiset solmupisteet.

Konesalidokumentaatiossa voidaan kuvata:

- laiteräkit
- verkkolaitteet
- palvelimet
- palomuurit
- UPS-laitteet
- sähkösyötöt
- jäähdytys

Esimerkki:

```text
Konesali DC1

┌──────────────┐
│ Firewall     │
├──────────────┤
│ Core-SW1     │
├──────────────┤
│ Core-SW2     │
├──────────────┤
│ Server Rack  │
└──────────────┘
```

Konesalin rakenteen dokumentointi auttaa ymmärtämään palveluiden riippuvuuksia sekä mahdollistaa nopeamman reagoinnin laitevikoihin ja sähkökatkoihin.

---

## Kuituyhteydet

Valokuitu muodostaa usein verkon runkoyhteydet rakennusten, kerrosten tai konesalien välillä.

Tyypillisesti dokumentoidaan:

- kuidun tunnus
- kuituparin numero
- lähtöpiste
- päätepiste
- kuitutyyppi
- siirtonopeus

Esimerkki:

```text
Kuitu F-001

DC1 Core-SW1
        ↓
Single Mode Fiber
        ↓
DC2 Core-SW2
```

Kuituyhteyksien dokumentointi on erityisen tärkeää, koska fyysisen kuitukatkon sijainnin selvittäminen voi muuten olla erittäin aikaa vievää.

---

## Miksi fyysinen topologia on tärkeä?

Fyysinen topologia auttaa vastaamaan seuraaviin kysymyksiin:

- Missä laite sijaitsee?
- Mitä kaapelointia laite käyttää?
- Mitkä laitteet ovat yhteydessä toisiinsa?
- Missä ristikytkentä sijaitsee?
- Miten rakennukset on yhdistetty?
- Mitä kuituyhteyksiä verkossa on?

Fyysinen topologia toimii perustana verkkoinventaariolle, häiriönhallinnalle, muutostöille sekä kapasiteetti- ja laajennussuunnittelulle.

---

## Lähteet

- RFC 8345: A YANG Data Model for Network Topologies  
  https://datatracker.ietf.org/doc/rfc8345/ 【1-ecd2d3】【2-c34ec1】

- IETF RFC 8346: A YANG Data Model for Layer 3 Topologies  
  https://www.rfc-editor.org/rfc/rfc8346

- Cisco Enterprise Campus Network Design Guide  
  https://www.cisco.com/

- BICSI Telecommunications Distribution Methods Manual (TDMM)

- TIA-568 Structured Cabling Standards
## Looginen topologia

### Mitä on looginen topologia?

Esitettävät asiat:

- aliverkot
- VLANit
- reititys
- yhteydet
- hallintaverkot

### Esimerkki

```text
Users VLAN
     |
Core Router
     |
Server VLAN
```

## Miksi molemmat tarvitaan?

```text
Palvelin ei vastaa
   ↓
Missä laite on?
   ↓
Fyysinen topologia

Miten liikenne kulkee?
   ↓
Looginen topologia
```

### Lähteet

- https://www.rfc-editor.org/rfc/rfc8345
- https://www.cisco.com/

---

# 3. Dokumentaatio osana verkonhallintaa

## Mitä dokumentoidaan?

### Verkkolaitteet

- nimi
- IP-osoite
- käyttöjärjestelmä
- sijainti
- vastuuhenkilö

### Palvelimet

- rooli
- käyttöjärjestelmä
- palvelut

### Verkkoyhteydet

- portit
- VLANit
- nopeudet

### Osoitteistus

- IPv4
- IPv6
- DHCP-alueet

## Dokumentoinnin laatukriteerit

### Ajantasainen

Dokumentaation tulee kuvata todellista ympäristöä.

### Löydettävä

Tieto löytyy yhdestä paikasta.

### Yksiselitteinen

Ei tulkinnanvaraa.

### Versionhallittu

Kaikki muutokset ovat jäljitettävissä.

### Lähteet

- https://docs.github.com/
- https://www.markdownguide.org/

---

# 4. Documentation as Code

## Perinteinen malli

```text
Word
Excel
PDF
Visio
```

### Ongelmia

- vanhenee nopeasti
- useita versioita
- hajallaan

## Moderni malli

```text
Git
GitHub
Markdown
```

Dokumentaatio on:

- tekstitiedostoja
- versionhallittuja
- auditoitavia
- automatisoitavia

## Git-versionhallinta

Opiskelijan tulee ymmärtää:

```text
clone
add
commit
push
pull
```

sekä

```text
Mitä muutettiin?
Kuka muutti?
Milloin muutettiin?
```

### Lähteet

- https://docs.github.com/en/get-started/using-git/about-git

---

# 5. Single Source of Truth

## Ongelma

Sama tieto löytyy:

- Excelistä
- Visiosta
- Wiki-sivulta

ja ne ovat ristiriidassa keskenään.

## Ratkaisu

Yksi virallinen tietolähde.

Esimerkiksi:

```text
NetBox
```

tai

```text
Containerlab-topologia
```

## Hyödyt

- vähemmän virheitä
- automaatio mahdollista
- dokumentaatio pysyy ajan tasalla

### Lähteet

- https://netboxlabs.com/docs/netbox/
- https://networktocode.com/

---

# 6. NetBox ja IPAM

## Mitä NetBox on?

NetBox on DCIM- ja IPAM-järjestelmä.

- DCIM = Data Center Infrastructure Management
- IPAM = IP Address Management

## Mitä NetBoxiin tallennetaan?

### Laitteet

- reitittimet
- kytkimet
- palvelimet

### Verkot

- IPv4
- IPv6
- VLANit

### Kaapeloinnit

- yhteydet
- portit

### Sijainnit

- rakennus
- kerros
- konesali

## NetBox Single Source of Truth -ratkaisuna

```text
NetBox
     |
     ├─ Dokumentaatio
     ├─ Inventaario
     ├─ Ansible
     └─ Monitorointi
```

### Lähteet

- https://netboxlabs.com/docs/netbox/
- https://github.com/netbox-community/netbox

---

# 7. Laitteiden inventointi

## Mikä on inventaario?

Laiteluettelo kaikista hallittavista resursseista.

| Tieto | Esimerkki |
|--------|------------|
| Hostname | r1 |
| IP | 10.0.0.1 |
| Rooli | Router |
| OS | FRRouting |

## Miten inventaario muodostetaan?

### Käsin

Pienet ympäristöt.

### Automaattisesti

- SNMP
- NetBox
- Nmap
- API-rajapinnat

### Lähteet

- https://nmap.org/book/

---

# 8. Verkon topologian automaattinen muodostaminen

## Miksi?

Verkot muuttuvat jatkuvasti.

Käsin piirretty kuva vanhenee nopeasti.

## Tiedon lähteitä

### SNMP

- LLDP
- CDP
- interface-tiedot

### Controller API

- Cisco DNA Center
- Aruba Central

### NetBox

- kaapeloinnit
- laitteet

### Containerlab

- topology file

## Esimerkki

```text
SNMP
   ↓
Naapuritiedot
   ↓
Topologiageneraattori
   ↓
Verkkokaavio
```

### Lähteet

- https://containerlab.dev/
- https://standards.ieee.org/standard/802_1AB-2022.html

---

# 9. Dokumentaation automatisointi

## Miksi?

Dokumentaatio vanhenee jatkuvasti.

## Mitä voidaan automatisoida?

- inventaariot
- IP-listat
- topologiat
- monitorointikonfiguraatiot
- Ansible-inventaariot

## Käytännön esimerkki

```text
Containerlab
      ↓
Topologia
      ↓
Dokumentaatio
      ↓
Prometheus
      ↓
Ansible
```

Kaikki käyttävät samaa tietolähdettä.

### Lähteet

- https://containerlab.dev/
- https://docs.ansible.com/

---

# 10. Yhteenveto

Kurssin aikana opiskelija rakentaa dokumentaation, joka toimii myöhempien harjoitusten perustana.

```text
Dokumentointi
      ↓
Inventointi
      ↓
NetBox
      ↓
SNMP
      ↓
Monitorointi
      ↓
Automaatio
      ↓
Verkonhallinta
```

## Kurssin punainen lanka

```text
Week01 Dokumentointi
          ↓
Week02 SNMP
          ↓
Week03 Ansible
          ↓
Week04 Tietoturva
          ↓
Week05 Observability
          ↓
Week06 Zabbix / Prometheus
```

Dokumentaatio muodostaa perustan kaikille myöhemmille verkonhallinnan työkaluille. Hyvin ylläpidetty dokumentaatio mahdollistaa automaation, monitoroinnin, inventaarion hallinnan sekä tehokkaan häiriönhallinnan.