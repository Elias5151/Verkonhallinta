# Johdanto


  Zabbix on ohjelmisto, jota käytetään it-infrastruktuurin valmomiseen. Sen päätehtävä on auttaa ylläpitäjiä havaitsemaan ongelmat ja varmistamaan järjestelmien ja laitteiden jatkuva toimivuus

---
## Hostien lisääminen

  Zabbix valvontaan on lisätty web1, db1 ja branch-client. Niitä valvotaan zabbix-agenttien avulla.
  
---

## Dashboard

![](https://github.com/Elias5151/Verkonhallinta/blob/main/reports/week06/images/Screenshot%202026-10-21%20151604.png)

---

## Mittarit

| Mittari | Arvo | Merkitys |
|----------|----------|----------|
| CPU Utilization | 1.2% | kertoo CPU:n käyttöasteen prosentteina |
| Memory Utilization | 23% | ketroo RAM:n käyttöasteen prosentteina |
| Network Traffic | received 4.5kbps / sent 12kbps | kertoo lähetetyn sekä vastaanotetun liikenteen nopeuden ja mahdolliset packet errorit |
| Disk Average Waiting Time | r_await 2.4ms / w_await 1.5ms | kertoo keskiarvon siitä, kuinka kauan data pyynnöt ovat jonossa kunnes levy alkaa prossesoimaan niitä |
| Memory Usage | total memory 15.15gb / available memory 11.61gb | kertoo muistin määrän ja kuinka paljon siitä on käytettävissä |

    Miksi mittareita kannattaa seurata?
        - CPU Utilization
            - Kriittisin mittari tietokoneen tai palvelimen suorituskyvyn ja terveyden arvioinnissa.
            Kertoo suoraan kuinka suuri osa prosessorin laskentatehosta on parhaillaan käytössä.
        - Memory Utilization
            - Seuraaminen on kriittistä, koska se auttaa ennakoimaan suorituskykyongelmia
            ja kaatumisia ennen kuin vaikutus näkyy käyttäjille. 
            - Keskeisimmät syyt jatkuvaan seurantaan on: 
                - suorituskyvyn ylläpito ja swapping:n estäminen
                - palvelujen kaatumisen välttäminen
                - muistuvuotojen havaitseminen
                - kapasiteetin suunnittelu
                - kustannusoptimointi
        - Network Traffic
            - Jatkuva verkkoliikenteen seuranta on ensisijaisen tärkeää tietoturvan ylläpitämiseksi ja
            liiketoiminnan jatkuvuuden varmistamiseksi.
        - Disk Average Waiting Time
            - Levyn keskimääräisen odotusajan seuraaminen on tärkeää,
            koska tallennusmedian luku- ja kirjoitusnopeus on tyypillisesti koko tietojärjestelmän hitain lenkki.
            Suuri odotusaika tarkoittaa, että prosessit joutuvat jonottamaan dataa, mikä näyttäytyy käyttäjälle suoraan järjestelmän tai sovellusten hitautena.

---

## Triggerit

  Määritetyt triggerit:
  ![](https://github.com/Elias5151/Verkonhallinta/blob/main/reports/week06/images/Screenshot%202026-10-22%20175535.png)

  Molemmat triggerit saatu syntymään. levytilasta hälytys ilmestyi lähes heti, kun taas cpu hälytyksessä meni hieman reilu minuutti.

   ![](https://github.com/Elias5151/Verkonhallinta/blob/main/reports/week06/images/Screenshot%202026-10-22%20180119.png)
   
   ![](https://github.com/Elias5151/Verkonhallinta/blob/main/reports/week06/images/Screenshot%202026-10-22%20181354.png)

---

## Hälytys- ja häiriötestit

  Hälytykset triggereistä saatiin kuvissa näkyvillä komennoilla:
  ![](https://github.com/Elias5151/Verkonhallinta/blob/main/reports/week06/images/Screenshot%202026-10-22%20181408.png)
  
  ![](https://github.com/Elias5151/Verkonhallinta/blob/main/reports/week06/images/Screenshot%202026-10-22%20181428.png)

  Käytetty komentoa "pkill node_exporter". Tilanne ei näy zabbixissa. Zabbixia ei ole määritelty seuraamaan node_exporter:in tilaa.

---

## Vertailu

| Ominaisuus | SNMP | Prometheus | Zabbix |
|------------|------|------------|--------|
| Tiedonkeruu | pull-kyselyt ja push-traps| pull http-metriikat | push ja pull, agentit, snmp |
| Dashboardit | ei omaa tarvitsee 3-osapuolen | saa hienoja dashboardeja Grafanan avulla | saa tehtyä laajasti dashboardeja |
| Hälytykset | traps | saa hälytyksiä esim. slackiin lisäämällä alertmanager komponentin | monipuoliset sisäänrakennetut hälytykset |
| Käyttöönotto | helppo ottaa käyttöön | nopea kontti- ja pilviympäristöissä | vaativampi käyttöönotto |
| Skaalautuvuus | hyvä verkolaitteille | erinomainen | erinomainen |
| Yrityskäyttö | hyvä reitittimille ja kytkimille | hyvä pilviympäristöön | perinteinen it-infrastruktuurin valvonta |

    Keskitetyn valvonnat suurin hyöty on kaiken tiedon löytyminen yhdeltä alustalta.
    Kun kaikki tieto on yhdellä alustalla on laitteiden ja järjestelmien kokonaisterveyttä ja -toimivuutta helppo seurata.
    Hälytysten- ja kapasiteetin hallinta myös helppottuu, kaiken tiedon näkyessä samalla alustalla.
    Mielestäni tärkeimpiä mittareita ovat: CPU Utilization, Memory Utilization, Free Disk Space ja Network Transmit/Received.
    Ylläpitäjän pitäisi saada hälytys monenlaisissa eri tilanteissa esim.
    Jos missään yllämainituista mittareista tapahtuu merkittäviä muutoksia pitkällä aikavälillä tai jos jonkin mittarin arvo kohoaa hyvin korkeaksi esim.
    CPU Util > 90%. Hälytys olisi hyvä saada myös palvelun kaatuessa tai tietoturvapoikkeamissa.
    Käyttäysin Prometheusta Zabbixin sijasta, jos haluiasin vain näyttää metrikooita graafeissa.
    Zabbixin valitsisin yleiseen valvontaan ja hälytysten saamiseen.
    Jos kurssin ympäristöön tulisi vielä lisätä valvontatoimintoja lisäisin esim. tietoturva ja verkkoliikenne hälytyksiä kuten:
        - salasan vaihto
        - verkkoliikenteen iso käyttö
        - verkkoliikenteen hitaus
        - salasanan monta kertaa väärin syöttö
---

