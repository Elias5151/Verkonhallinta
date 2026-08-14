Miksi verkkoa valvotaan? 

Tietoverkko on yksi organisaation tärkeimmistä teknisistä järjestelmistä. Käytännössä lähes kaikki palvelut ovat tavalla tai toisella riippuvaisia toimivasta verkosta. Verkon kautta käytetään esimerkiksi pilvipalveluita, sähköpostia, tiedostopalveluita, toiminnanohjausjärjestelmiä ja verkkopalveluita. 

Verkon käyttäjät odottavat palveluiden olevan käytettävissä jatkuvasti. Tämän vuoksi verkon toimintaa on seurattava jatkuvasti ja mahdollisiin ongelmiin on pystyttävä reagoimaan nopeasti. 

Verkon valvonnan tavoitteena on: 

varmistaa palveluiden käytettävyys 

havaita häiriöt mahdollisimman nopeasti 

tunnistaa suorituskykyongelmat ennen niiden vaikutusta käyttäjiin 

kerätä tietoa kapasiteetin suunnittelua varten 

helpottaa vianmääritystä 

tukea verkon kehittämistä pitkällä aikavälillä 

Ilman jatkuvaa valvontaa verkon ylläpito perustuu pitkälti arvailuun ja käyttäjien vikailmoituksiin. 

 

Verkon ylläpidon haasteet 

Nykyaikainen tietoverkko koostuu tyypillisesti useista eri teknologioista ja järjestelmistä. 

Yksinkertaisessakin ympäristössä voi olla: 

reitittimiä 

kytkimiä 

langattomia tukiasemia 

palvelimia 

virtualisointialustoja 

pilvipalveluita 

tietoturvalaitteita 

internet-yhteyksiä 

Jokainen näistä voi muodostaa häiriötilanteen lähteen. 

Esimerkiksi käyttäjän näkökulmasta ongelma voi näyttäytyä yksinkertaisesti seuraavasti: 

"Verkko ei toimi." 

Todellisuudessa taustalla voi olla kymmeniä erilaisia syitä. 

Ongelma voi liittyä esimerkiksi: 

fyysiseen verkkokaapeliin 

kytkinporttiin 

väärään VLAN-konfiguraatioon 

täyttyneeseen verkkoliitäntään 

DNS-palveluun 

palvelimen suorituskykyyn 

virheelliseen reititykseen 

internet-operaattorin häiriöön 

Mitä suurempi ympäristö on, sitä vaikeampaa järjestelmän kokonaistilan hahmottaminen ilman valvontatyökaluja on. 

 

Miksi häiriöitä syntyy? 

Vaikka verkko olisi suunniteltu hyvin, häiriöitä syntyy väistämättä. 

Tyypillisiä syitä ovat: 

Laitteistoviat 

Laitteiden komponentit kuluvat ajan myötä. 

Esimerkiksi: 

verkkokortti voi rikkoutua 

virtalähde voi vioittua 

levyjärjestelmä voi epäonnistua 

kuitumoduuli voi lakata toimimasta 

 

Konfiguraatiovirheet 

Yksi yleisimmistä häiriöiden aiheuttajista on ihmisen tekemä virhe. 

Esimerkiksi: 

väärä IP-osoite 

puuttuva reitti 

virheellinen palomuurisääntö 

väärä VLAN-määritys 

Pienikin muutos voi aiheuttaa laajoja vaikutuksia koko verkkoon. 

 

Kapasiteettiongelmat 

Alun perin riittävä verkko voi muuttua kuormituksen kasvaessa hitaaksi. 

Esimerkiksi: 

käyttäjämäärä kasvaa 

palveluita lisätään 

varmuuskopiointi käyttää enemmän kaistaa 

videoliikenne lisääntyy 

Tällöin palvelu ei välttämättä lakkaa toimimasta kokonaan, mutta sen suorituskyky heikkenee merkittävästi. 

 

Ohjelmistovirheet 

Verkkolaitteiden käyttöjärjestelmät sisältävät ohjelmistovirheitä samalla tavalla kuin muutkin ohjelmistot. 

Virheet voivat aiheuttaa: 

yhteyksien katkeamista 

muistivuotoja 

suorituskykyongelmia 

palveluiden kaatumisia 

 

Ulkoiset tekijät 

Kaikki ongelmat eivät sijaitse organisaation omassa ympäristössä. 

Esimerkiksi: 

sähkökatkokset 

internet-operaattorin häiriöt 

pilvipalveluiden ongelmat 

palvelunestohyökkäykset 

voivat näkyä käyttäjälle samalla tavalla kuin paikallinen verkkovika. 

 

Miksi pelkkä käyttäjän vikailmoitus ei riitä? 

Monessa organisaatiossa ensimmäinen merkki ongelmasta on käyttäjän yhteydenotto helpdeskiin. 

Esimerkiksi: 

"Verkkolevy avautuu hitaasti." 

tai 

"Teams pätkii." 

Tällaiset ilmoitukset ovat tärkeitä, mutta niiden perusteella ei vielä tiedetä ongelman syytä. 

Käyttäjä näkee vain oireen. 

Ylläpitäjän tehtävä on selvittää: 

mikä aiheuttaa oireen 

missä ongelma sijaitsee 

kuinka laajalle ongelma vaikuttaa 

kuinka vakava ongelma on 

Ilman mittausdataa ongelman selvittäminen muuttuu arvailuksi. 

 

Esimerkkitilanne 

Käyttäjä ilmoittaa: 

"Palvelu toimii erittäin hitaasti." 

Ylläpitäjän on selvitettävä esimerkiksi seuraavat kysymykset: 

Onko yhteys poikki? 

Jos verkkoyhteys katkeilee, sovellukset voivat vaikuttaa hitailta vaikka varsinainen ongelma olisi verkkokerroksessa. 

 

Onko palvelin kuormittunut? 

Jos palvelimen prosessorikuorma on jatkuvasti 100 %, käyttäjä kokee palvelun hitaaksi vaikka verkko toimisi normaalisti. 

 

Onko verkkoliitäntä täynnä? 

Jos palvelimen tai reitittimen verkkoliitäntä toimii jatkuvasti lähellä maksimikapasiteettiaan, pakettien määrä kasvaa ja viiveet pitenevät. 

 

Onko DNS-palvelussa ongelma? 

Monet sovellukset käyttävät nimipalvelua jatkuvasti. 

Jos DNS-palvelin vastaa hitaasti, käyttäjä voi tulkita ongelman verkkoviaksi tai palvelinviaksi. 

 

Vaikuttaako ongelma kaikkiin käyttäjiin? 

Jos ongelma koskee vain yhtä käyttäjää, syynä voi olla paikallinen työasema tai lähiverkkoyhteys. 

Jos ongelma koskee kaikkia käyttäjiä, syy on todennäköisesti keskeisemmässä infrastruktuurissa. 

 

Reaktiivinen ja proaktiivinen ylläpito 

Verkon ylläpito voidaan jakaa kahteen toimintamalliin. 

Reaktiivinen ylläpito 

Reaktiivisessa ylläpidossa toimenpiteisiin ryhdytään vasta, kun ongelma on jo vaikuttanut käyttäjiin. 

Toimintamalli on usein seuraava: 

Häiriö tapahtuu. 

Käyttäjä ilmoittaa ongelmasta. 

Ylläpito aloittaa selvityksen. 

Ongelma korjataan. 

Mallin haittapuolena on, että palvelukatko on jo ehtinyt vaikuttaa käyttäjiin. 

 

Proaktiivinen ylläpito 

Proaktiivisessa ylläpidossa verkon toimintaa seurataan jatkuvasti mittausten avulla. 

Esimerkiksi: 

kaistan käyttöaste kasvaa 

muistin käyttö lisääntyy 

levytila alkaa loppua 

verkkovirheet lisääntyvät 

Valvontajärjestelmä voi havaita tilanteen ennen varsinaista häiriötä. 

Tällöin ylläpito voi korjata ongelman jo ennen kuin käyttäjät huomaavat sitä. 

 

Esimerkki 

Ilman valvontaa: 

1     Verkkoliitäntä täyttyy 

2             ↓ 

3     Yhteydet hidastuvat 

4             ↓ 

5     Käyttäjät valittavat 

6             ↓ 

7     Vikaa ryhdytään tutkimaan 

Valvonnan avulla: 

1     Verkkoliitäntä saavuttaa 80 % käyttöasteen 

2             ↓ 

3     Valvontajärjestelmä hälyttää 

4             ↓ 

5     Kapasiteettia lisätään 

6             ↓ 

7     Käyttäjät eivät huomaa ongelmaa 

 

Miksi mittaaminen on välttämätöntä? 

Verkonhallinnassa tehdyt päätökset tulisi perustaa mitattuun tietoon eikä oletuksiin. 

Mittaamisen avulla voidaan vastata esimerkiksi seuraaviin kysymyksiin: 

Onko laite käytettävissä? 

Kuinka paljon verkkoliikennettä kulkee verkossa? 

Mitkä yhteydet ovat kuormittuneita? 

Milloin ongelma alkoi? 

Kuinka vakava ongelma on? 

Vaikuttaako ongelma yhteen vai useaan käyttäjään? 

Onko tilanne poikkeuksellinen vai normaali? 

Tämän vuoksi nykyaikaisessa verkonhallinnassa kerätään jatkuvasti tietoa verkkolaitteista, palvelimista ja palveluista. Yksi yleisimmin käytetyistä tiedonkeruumenetelmistä on SNMP (Simple Network Management Protocol), jonka toimintaa tarkastellaan seuraavaksi. 


Häiriönhallinta (Fault Management) ja Observability

Modernit tietoverkot ja IT-järjestelmät muodostuvat useista palvelimista, verkkolaitteista, pilvipalveluista, sovelluksista ja niiden välisistä riippuvuuksista. Mitä monimutkaisempi ympäristö on, sitä tärkeämpää on kyky havaita häiriöt nopeasti, ymmärtää niiden syyt ja palauttaa palvelut normaalitilaan mahdollisimman vähäisin vaikutuksin.

Häiriönhallinnan tavoitteena on varmistaa järjestelmien käytettävyys, luotettavuus ja suorituskyky. Perinteisesti häiriönhallinta on perustunut erilaisten valvontatyökalujen tuottamiin hälytyksiin, mutta nykyisissä ympäristöissä korostuu myös observability eli järjestelmän havainnoitavuus. Observability auttaa ymmärtämään paitsi sen, että ongelma on olemassa, myös miksi se tapahtuu.

FCAPS-malli

Tietoliikenne- ja verkkoympäristöjen hallintaa voidaan tarkastella kansainvälisesti tunnetun FCAPS-mallin avulla. Malli jakaa verkonhallinnan viiteen osa-alueeseen:

Fault (Häiriönhallinta)

Keskittyy vikojen havaitsemiseen, tunnistamiseen, analysointiin ja korjaamiseen. Tavoitteena on minimoida käyttökatkojen vaikutukset ja palauttaa palvelut mahdollisimman nopeasti.

Configuration (Konfiguraationhallinta)

Vastaa laitteiden ja palveluiden asetusten hallinnasta, dokumentoinnista sekä muutosten seurannasta. Konfiguraationhallinnan avulla voidaan esimerkiksi palauttaa toimiva konfiguraatio virheellisen muutoksen jälkeen.

Accounting (Käytön seuranta)

Seuraa resurssien käyttöä, käyttäjiä ja mahdollisia kustannuksia. Esimerkkejä ovat verkkoliikenteen mittaaminen tai pilvipalveluiden kustannusseuranta.

Performance (Suorituskyvyn hallinta)

Tarkastelee järjestelmien ja verkkojen suorituskykyä. Tavoitteena on havaita mahdolliset pullonkaulat ennen kuin ne aiheuttavat häiriöitä.

Security (Tietoturvallisuus)

Keskittyy järjestelmien suojaamiseen, poikkeamien tunnistamiseen sekä tietoturvatapahtumien hallintaan.

Kurssilla keskitytään erityisesti seuraaviin osa-alueisiin:

Fault Management
Performance Management
Configuration Management

Nämä muodostavat käytännössä päivittäisen verkkoylläpidon keskeisimmän osaamisen perustan.

Häiriönhallinnan prosessi

Häiriönhallinta on järjestelmällinen prosessi, jonka avulla ongelmat ratkaistaan tehokkaasti ja niiden toistuminen pyritään estämään.

1. Häiriön havaitseminen

Ensimmäinen vaihe on poikkeaman tunnistaminen. Häiriö voidaan havaita:

Valvontajärjestelmän hälytyksenä
Lokiviestien perusteella
Suorituskykymittareiden poikkeamina
Käyttäjän ilmoittamana vikana

Esimerkki:

Palvelin ei vastaa ping-kyselyihin.
CPU-kuorma nousee poikkeuksellisen korkeaksi.
Verkkolaitteen rajapinta menee alas.

Tavoitteena on havaita ongelma mahdollisimman nopeasti ennen kuin käyttäjät kärsivät merkittävistä palvelukatkoista.

2. Häiriön tunnistaminen

Kun häiriö on havaittu, seuraava tehtävä on selvittää mitä on tapahtunut.

Tyypillisiä kysymyksiä ovat:

Mikä palvelu on häiriintynyt?
Mitkä järjestelmät ovat vaikutusalueella?
Milloin ongelma alkoi?
Onko kyseessä uusi vai aiemmin tunnettu ongelma?

Esimerkiksi verkkopalvelun toimimattomuus voi johtua:

Verkkoyhteysongelmasta
DNS-ongelmasta
Palvelimen kaatumisesta
Sovellusvirheestä
3. Häiriön analysointi

Analysointivaiheessa etsitään häiriön juurisyy.

Tyypillisiä menetelmiä ovat:

Lokien tutkiminen
Mittausdatan analysointi
Verkkoliikenteen tarkastelu
Muutoshistorian tarkistaminen

Monissa tapauksissa ongelman syy löytyy äskettäin tehdystä muutoksesta, kuten:

ohjelmistopäivityksestä
verkkokonfiguraation muutoksesta
virheellisestä automaatiosta

Tätä vaihetta kutsutaan usein myös root cause analysis (RCA)-prosessiksi.

4. Korjaaminen

Kun syy on tunnistettu, voidaan toteuttaa tarvittavat korjaavat toimenpiteet.

Esimerkkejä:

Palvelun uudelleenkäynnistys
Virheellisen konfiguraation korjaaminen
Verkkolaitteen vaihto
Ohjelmistovirheen korjauspäivitys
Muutoksen peruuttaminen (rollback)

Korjausten jälkeen järjestelmän toiminta tulee varmistaa mittaamalla ja testaamalla palvelun palautuminen normaalitilaan.

5. Jälkianalyysi

Vakavampien häiriöiden jälkeen suoritetaan jälkianalyysi.

Tavoitteena on vastata kysymyksiin:

Mikä aiheutti häiriön?
Miksi sitä ei havaittu aikaisemmin?
Miten vastaava ongelma voidaan estää tulevaisuudessa?
Tarvitaanko uusia valvontoja tai prosesseja?

Jälkianalyysi on tärkeä osa organisaation oppimista ja jatkuvaa kehittämistä.

6. Dokumentointi

Kaikki häiriöt ja niiden ratkaisut tulee dokumentoida.

Tyypillisesti dokumentaatioon kirjataan:

Tapahtuman aikajana
Ongelman kuvaus
Vaikutukset palveluihin
Juurisyy
Tehdyt korjaustoimenpiteet
Kehitystoimenpiteet

Hyvä dokumentaatio nopeuttaa tulevien ongelmien ratkaisemista ja tukee organisaation tiedonhallintaa.

Observability

Perinteinen monitorointi vastaa kysymykseen:

Onko järjestelmä kunnossa?

Observability pyrkii vastaamaan syvällisempään kysymykseen:

Miksi järjestelmä ei toimi odotetulla tavalla?

Observability perustuu kolmeen keskeiseen tietolähteeseen:

Metrics

Metrikat ovat numeerisia mittauksia järjestelmän toiminnasta.

Esimerkkejä:

CPU-kuormitus
Muistin käyttö
Verkkoliikenteen määrä
Levyn käyttöaste

Metrikoiden avulla voidaan tunnistaa suorituskykyongelmia ja havaita poikkeamia.

Logs

Lokit sisältävät yksityiskohtaisia tapahtumatietoja järjestelmästä.

Esimerkkejä:

Kirjautumiset
Virheilmoitukset
Palveluiden käynnistykset
Konfiguraatiomuutokset

Lokit ovat usein tärkein tietolähde juurisyyn analysoinnissa.

Traces

Jäljitystiedot kuvaavat yksittäisen palvelupyynnön kulkua useiden järjestelmien läpi.

Niiden avulla voidaan nähdä esimerkiksi:

Missä vaiheessa sovellus hidastuu
Mikä palvelukomponentti aiheuttaa virheen
Kuinka kauan eri käsittelyvaiheet kestävät

Traces ovat erityisen hyödyllisiä hajautetuissa järjestelmissä ja mikropalveluarkkitehtuureissa. Tämän takia kurssilla keskitytään enemmän metriikoiden ja logien käyttämiseen. 




Miten observability-dataa kerätään? 

Jotta häiriö voidaan havaita, analysoida ja korjata, tarvitaan tietoa siitä, mitä verkossa ja järjestelmissä tapahtuu. Tätä tietoa kutsutaan observability-dataksi. Se koostuu esimerkiksi suorituskykymittauksista, lokeista, hälytyksistä ja verkkoliikenteen tiedoista. Observabilityn tavoitteena on antaa ylläpitäjälle mahdollisuus vastata kysymyksiin: 

Onko järjestelmä kunnossa? 

Mitä juuri tapahtui? 

Miksi ongelma syntyi? 

Miten ongelma voidaan korjata? 



Tyypillisesti tiedonkeruu muodostaa seuraavan kaltaisen ketjun:

Esimerkiksi kytkin voi havaita verkkorajapinnan menevän alas. Monitorointijärjestelmä saa tiedon, luo hälytyksen ja ilmoittaa asiasta ylläpitäjälle, joka aloittaa häiriönhallintaprosessin. SNMP perustuu manager-agent-malliin, jossa monitorointijärjestelmä kysyy tietoja laitteilta tai vastaanottaa niiden lähettämiä hälytyksiä (traps). [cisco.com], [learningne....cisco.com] 

Miksi observability-dataa tarvitaan? 

Ilman jatkuvaa tiedonkeruuta ylläpitäjä joutuu odottamaan käyttäjien vikailmoituksia. Tällöin toiminta on reaktiivista. Observability mahdollistaa proaktiivisen ylläpidon, jossa ongelmat havaitaan ennen kuin ne aiheuttavat merkittäviä käyttökatkoja. Observability perustuu tyypillisesti mittareihin (metrics), lokeihin (logs) ja jäljitystietoihin (traces), joiden avulla voidaan ymmärtää järjestelmän toimintaa ja ongelmien juurisyitä. [opentelemetry.io], [opentelemetry.io] 

 

Observability-datan tietolähteet 

Nykyaikaisessa ympäristössä monitorointijärjestelmä voi kerätä tietoa useista eri lähteistä. Jokaisella menetelmällä on omat vahvuutensa. 

SNMP (Simple Network Management Protocol) 

SNMP on verkonhallinnan perinteinen ja edelleen erittäin yleinen tiedonkeruumenetelmä. SNMP:n avulla voidaan lukea verkkolaitteiden ja palvelimien tilatietoja, kuten: 

CPU-kuorma 

Muistin käyttö 

Rajapintojen liikennemäärät 

Virhelaskurit 

Laitteiden lämpötilat 

SNMP perustuu agenttiin, joka toimii valvottavassa laitteessa, sekä manageriin, joka kerää tiedot keskitetysti. Lisäksi laite voi lähettää itsenäisesti hälytyksiä eli trap-viestejä merkittävistä tapahtumista. [cisco.com], [learningne....cisco.com] 

Kurssin myöhemmissä harjoituksissa SNMP toimii keskeisenä tekniikkana, jonka avulla mittausdataa kerätään verkkolaitteilta monitorointijärjestelmään. 

 

Syslog 

SNMP kertoo yleensä laitteen nykytilan, mutta ei välttämättä selitä miksi jotain tapahtui. 

Tätä varten käytetään Syslogia. 

Syslog on standardoitu lokien siirtoprotokolla, jonka avulla verkkolaitteet, palvelimet ja sovellukset lähettävät tapahtumatietoja keskitetylle lokipalvelimelle. Syslog-viestejä voivat olla esimerkiksi: 

käyttäjän kirjautuminen 

palvelun käynnistyminen 

rajapinnan katkeaminen 

virheilmoitus 

tietoturvatapahtuma 

Keskitetty lokien kerääminen mahdollistaa tapahtumien tutkimisen myöhemmin sekä häiriöiden juurisyiden analysoinnin. Syslog on standardoitu RFC 5424 -määrityksessä. [rfc-editor.org], [rfcinfo.com] 

 

API 

Monet modernit järjestelmät tarjoavat tietoja ohjelmointirajapintojen (API) kautta. 

Esimerkiksi: 

Kubernetes 

VMware vSphere 

Proxmox VE 

Pilvipalvelut (Azure, AWS, Google Cloud) 

Verkkolaitteiden hallintajärjestelmät 

Monitorointijärjestelmä voi hakea tietoja suoraan API-kyselyillä ilman SNMP:tä. API:t mahdollistavat usein huomattavasti laajemman tietomäärän keräämisen kuin perinteiset MIB-pohjaiset SNMP-kyselyt. 

API-pohjainen monitorointi on yhä tärkeämpää erityisesti pilvi- ja virtualisointiympäristöissä. 

 

NetFlow 

SNMP kertoo paljonko liikennettä rajapinnalla kulkee, mutta ei sitä, kuka liikennettä aiheuttaa. 

Tätä varten käytetään NetFlow'ta. 

NetFlow kerää verkkoliikenteestä virtoja (flows) ja tuottaa tietoa esimerkiksi: 

lähdeosoitteesta 

kohdeosoitteesta 

käytetystä protokollasta 

käytetyistä porteista 

siirrettyjen tavujen määrästä 

NetFlow'n avulla voidaan tunnistaa: 

suurimmat liikenteen aiheuttajat 

ruuhkien syyt 

epätavallinen liikenne 

tietoturvapoikkeamat 

Tyypillinen NetFlow-ratkaisu koostuu kolmesta osasta: 



NetFlow tarjoaa huomattavasti tarkemman näkymän verkkoliikenteeseen kuin pelkkä SNMP. [en.wikipedia.org], [kentik.com] 

 

Prometheus

Prometheus kerää aikasarjamuotoista mittausdataa palvelimilta ja sovelluksilta.

Sitä käytetään erityisesti:

Linux-palvelimien monitorointiin
Konttiympäristöihin
Pilviympäristöihin

Prometheus mahdollistaa tehokkaat hälytykset ja pitkän aikavälin suorituskykyanalyysin.

Grafana

Grafana tarjoaa visualisointialustan mittausdatalle.

Sen avulla voidaan rakentaa:

Hallintapaneeleja (dashboards)
Reaaliaikaisia näkymiä
Hälytysjärjestelmiä
Raportteja

Grafanaa käytetään usein yhdessä Prometheuksen kanssa.

Zabbix

Zabbix on kokonaisvaltainen verkkovalvontaratkaisu.

Se tarjoaa:

Valvonnan
Hälytykset
Raportoinnin
SNMP-tuen
Agenttipohjaisen monitoroinnin

Zabbix soveltuu hyvin organisaatioiden keskitettyyn valvontaan.

Streaming Telemetry 

Verkkojen nopeuksien ja laitemäärien kasvaessa perinteinen SNMP-pollaus ei aina riitä. 

Streaming Telemetry on modernimpi lähestymistapa, jossa laitteet lähettävät tietoa jatkuvana virtana monitorointijärjestelmälle ilman erillisiä kyselyjä. Data voidaan lähettää jopa sekunnin murto-osien tarkkuudella. [blog.paessler.com], [riverbed.com], [cisco.com] 

Perinteinen SNMP toimii näin: 

1     Monitorointi ──► Kysyy tiedon 

2     Laite         ──► Vastaa 

Streaming Telemetry toimii näin: 

1     Laite ──► Lähettää tietoa jatkuvasti 

2             ──► Collector 

3             ──► Analytiikka 

Streaming Telemetryn etuja ovat: 

reaaliaikaisempi näkyvyys 

pienempi viive häiriöiden havaitsemisessa 

tarkempi mittausdata 

parempi skaalautuvuus suuriin ympäristöihin 

Tekniikka on yleistynyt erityisesti datakeskus- ja palveluntarjoajaverkoissa. [blog.paessler.com], [riverbed.com] 

 

Yhteenveto 

Observability perustuu siihen, että järjestelmistä kerätään jatkuvasti tietoa analysointia varten. Tieto voidaan kerätä useilla eri menetelmillä: 

Menetelmä 

	

Käyttötarkoitus 




SNMP 

	

Laitteiden tila- ja suorituskykytiedot 




Syslog 

	

Tapahtuma- ja virhelokit 




API 

	

Modernien järjestelmien hallinta- ja tilatiedot 




NetFlow 

	

Verkkoliikenteen analysointi 




Streaming Telemetry 

	

Reaaliaikainen mittausdata 

Kurssin näkökulmasta SNMP muodostaa tärkeän perustan, sillä monet monitorointijärjestelmät hyödyntävät sitä edelleen verkkolaitteiden ja palvelimien valvontaan. Myöhemmissä opinnoissa opiskelija kohtaa myös muita tiedonkeruumenetelmiä, joita käytetään erityisesti moderneissa pilvi-, virtualisointi- ja datakeskusympäristöissä. 

Häiriönhallinnan tavoitteena on havaita ongelmat nopeasti, tunnistaa niiden syyt ja palauttaa palvelut toimintakuntoon mahdollisimman tehokkaasti. FCAPS-mallissa häiriönhallinta muodostaa yhden keskeisistä verkonhallinnan osa-alueista yhdessä suorituskyvyn, konfiguraationhallinnan, käytön seurannan ja tietoturvan kanssa.

Modernissa ympäristössä häiriönhallinta perustuu observability-ajatteluun, jossa metrikat, lokit ja jäljitystiedot muodostavat kokonaiskuvan järjestelmän toiminnasta. Työkalut kuten SNMP, Syslog, Prometheus, Grafana ja Zabbix mahdollistavat poikkeamien havaitsemisen, niiden analysoinnin sekä tehokkaan reagoinnin erilaisiin häiriötilanteisiin. Tämä osaaminen muodostaa perustan nykyaikaiselle verkkopalveluiden ja IT-infrastruktuurin ylläpidolle.

 

Lisälukemista 

OpenTelemetry Observability Primer 
https://opentelemetry.io/docs/concepts/observability-primer/ [opentelemetry.io] 

Cisco SNMP Overview 
https://www.cisco.com/c/en/us/td/docs/unified_computing/Intersight/IMM_SNMP_Monitoring/b_imm_snmp_monitoring_guide/m_overview_snmp_monitoring.pdf [cisco.com] 

RFC 5424: The Syslog Protocol 
https://www.rfc-editor.org/info/rfc5424/ [rfc-editor.org] 

Kentik: What is NetFlow? 
https://www.kentik.com/kentipedia/what-is-netflow-overview/ [kentik.com] 

Paessler: SNMP vs NetFlow vs Streaming Telemetry 
https://blog.paessler.com/network-streaming-telemetry-monitoring-in-real-time [blog.paessler.com] 

5. SNMP verkonhallinnan työkaluna

Vasta tässä kohtaa siirryttäisiin SNMP:ään.

Opiskelija ymmärtää nyt:

miksi tietoa kerätään
mitä tietoa kerätään
miksi SNMP on olemassa
SNMP:n perusteet

Kuva:



Plain Text

1
Manager
2
|
3
|
4
SNMP GET
5
|
6
v
7
Agent
8
|
9
v
10
MIB
Näytä lisää rivejä

Käsitteet:

Manager
Agent
MIB
OID

Nykyisestä materiaalista nämä kannattaa säilyttää. [TI00FF88-3...arn-Moodle]

6. SNMP:n käyttötavat

Opiskelijalle tärkein osuus Week02:n kannalta.

Pollaus

Manager kysyy tietoja.

Esimerkiksi:

CPU
RAM
Interface status


Plain Text

1
GET
2
GETNEXT
3
GETBULK
Näytä lisää rivejä
Trapit

Laite ilmoittaa itse tapahtumista.

Esimerkiksi:

portti alas
virtalähdevika
korkea CPU


Plain Text

1
TRAP
2
INFORM
Näytä lisää rivejä

Tämä liittyy hälytysjärjestelmiin.

7. SNMPv1, SNMPv2c ja SNMPv3

Nykyinen materiaali sisältää paljon historiaa. [TI00FF88-3...arn-Moodle]

Ehdottaisin supistamaan sen yhteen taulukkoon:

Versio	Turvallisuus
SNMPv1	Ei suojausta
SNMPv2c	Community String
SNMPv3	Tunnistus ja salaus

Johtopäätös:

Uusissa ympäristöissä käytetään aina SNMPv3:a.

8. Kurssin kannalta tärkeimmät OID:t

Tämä olisi erinomainen uusi osio.

Week02:ssa opiskelija käyttää käytännössä juuri näitä.

Järjestelmä


Plain Text

1
sysName
2
sysLocation
3
sysContact
4
sysUptime
Näytä lisää rivejä
Verkkoliitännät


Plain Text

1
ifDescr
2
ifAdminStatus
3
ifOperStatus
Näytä lisää rivejä
Laskurit


Plain Text

1
ifInOctets
2
ifOutOctets
Näytä lisää rivejä

Näiden avulla opiskelija näkee konkreettisesti mitä SNMP:llä voidaan kerätä.

9. SNMP Linux-palvelimella

Tämä loisi suoran yhteyden tehtävään.

Käsiteltävät asiat:

snmpd
agentti
community
SNMPv3 user

Esimerkkikaavio:



Plain Text

1
srv-monitor
2
← SNMP →
3
srv-client1
4
srv-client2
5
srv-client3
6
``
Näytä lisää rivejä

Tämä vastaa suoraan viikon harjoitusta.

10. SNMP osana verkonhallinnan kokonaisuutta

Loppuyhteenveto.



Plain Text

1
Dokumentaatio
2
↓
3
SNMP
4
↓
5
Monitorointi
6
↓
7
Hälytykset
8
↓
9
Häiriönhallinta
10
↓
11
Kehittäminen
Näytä lisää rivejä

SNMP:n käyttötavat 

SNMP:tä käytetään kahdella pääasiallisella tavalla: 

Pollaus (Polling) 

Trapit (Notifications) 

Pollaus 

Pollauksessa monitorointijärjestelmä kysyy tietoja määräajoin. 

1     Manager ----> Kysely 

2     Manager <---- Vastaus 

Esimerkkejä kysyttävistä tiedoista: 

CPU-kuormitus 

RAM-muistin käyttö 

levytila 

verkkoliitännän tila 

käyttöaika 

SNMP tukee useita kyselytyyppejä. 

GET 

Hakee yhden tietyn OID:n arvon. 

1     GET sysName.0 

GETNEXT 

Hakee seuraavan objektin MIB-puusta. 

Tätä käytetään usein tiedon selaamiseen. 

GETBULK 

Hakee useita objekteja yhdellä kyselyllä. 

Tämä vähentää verkkoliikennettä ja nopeuttaa tiedonkeruuta erityisesti suurissa ympäristöissä. 

Pollaus muodostaa käytännössä lähes kaiken suorituskyvyn monitoroinnin perustan. Monitorointijärjestelmä lukee säännöllisesti laitteiden tietoja ja tallentaa ne aikasarjatietokantaan raportointia ja analysointia varten. [cisco.com], [learningne....cisco.com] 

Trapit 

Kaikkia ongelmia ei ole tehokasta havaita pelkällä pollauksella. 

Tällöin käytetään trap-viestejä. 

Trapissa laite lähettää itse ilmoituksen monitorointijärjestelmälle ilman erillistä kyselyä. 

1     Laite ------> TRAP ------> Monitorointi 

Esimerkkejä tilanteista: 

verkkoliitäntä menee alas 

virtalähde vikaantuu 

lämpötila nousee liian korkeaksi 

CPU-kuorma ylittää raja-arvon 

TRAP 

Kevyt ilmoitusviesti. 

Laite lähettää tapahtuman eikä odota kuittausta. 

INFORM 

Trapin kehittyneempi versio. 

Vastaanottaja kuittaa viestin vastaanotetuksi, jolloin lähettäjä tietää ilmoituksen päätyneen perille. [cisco.com] 

Trapit ovat tärkeä osa hälytysjärjestelmiä, koska ne mahdollistavat nopean reagoinnin ongelmatilanteisiin. 

 

SNMPv1, SNMPv2c ja SNMPv3 

SNMP:stä on olemassa useita versioita. 

Versio 

	

Turvallisuus 




SNMPv1 

	

Ei suojausta 




SNMPv2c 

	

Community String 




SNMPv3 

	

Tunnistus ja salaus 

SNMPv1 

Ensimmäinen laajasti käytetty versio. 

Ei tarjoa varsinaista tietoturvaa. 

SNMPv2c 

Lisäsi suorituskykyparannuksia ja uusia komentoja. 

Tunnistautuminen perustuu community string -arvoihin. 

Yleisiä esimerkkejä: 

1     public 

2     private 

Tietoliikennettä ei kuitenkaan salata. 

SNMPv3 

Nykyinen suositeltu versio. 

Tarjoaa: 

käyttäjätunnistuksen 

viestien eheyden tarkistuksen 

salauksen 

SNMPv3 on tarkoitettu nykyisiin tuotantoympäristöihin ja tarjoaa merkittävästi paremman tietoturvan kuin aiemmat versiot. [cisco.com], [learningne....cisco.com] 

Käytännön suositus: uusissa ympäristöissä käytetään aina SNMPv3:a. 

 

 Kurssin kannalta tärkeimmät OID:t 

SNMP sisältää tuhansia objekteja, mutta alkuvaiheessa riittää muutaman keskeisen objektin hallitseminen. 

Järjestelmätiedot 

Objekti 

	

Tarkoitus 




sysName 

	

Laitteen nimi 




sysLocation 

	

Sijainti 




sysContact 

	

Yhteyshenkilö 




sysUpTime 

	

Käyttöaika 

Näiden avulla voidaan tunnistaa valvottava laite ja tarkistaa sen perustiedot. 

Verkkoliitännät 

Objekti 

	

Tarkoitus 




ifDescr 

	

Rajapinnan nimi 




ifAdminStatus 

	

Hallinnollinen tila 




ifOperStatus 

	

Todellinen toimintatila 

Näillä voidaan selvittää esimerkiksi onko verkkoliitäntä poistettu käytöstä vai onko yhteydessä todellinen vikatilanne. 

Liikennelaskurit 

Objekti 

	

Tarkoitus 




ifInOctets 

	

Vastaanotetut tavut 




ifOutOctets 

	

Lähetetyt tavut 

Näiden avulla voidaan laskea: 

kaistan käyttö 

liikennemäärät 

kuormitus 

liikennetrendit 

Suuri osa monitorointijärjestelmien verkkografiikoista perustuu juuri näihin laskureihin. 

 

SNMP Linux-palvelimella 

Linux-palvelimessa SNMP toteutetaan tavallisesti Net-SNMP-ohjelmistolla. 

Keskeinen palvelu on: 

1     snmpd 

Palvelu toimii SNMP-agenttina ja vastaa managerin kyselyihin. 

Tyypillinen ympäristö 

1                 SNMP Manager 

2                   srv-monitor 

3                        | 

4           --------------------------- 

5           |            |            | 

6           |            |            | 

7      srv-client1  srv-client2  srv-client3 

8           |            |            | 

9         snmpd        snmpd        snmpd 

Monitorointipalvelin kerää tietoja useilta palvelimilta samanaikaisesti. 

Community 

SNMPv1- ja SNMPv2c-ympäristöissä käytetään community string -arvoja. 

Esimerkki: 

1     public 

Community toimii eräänlaisena "salasanana", mutta sitä ei salata verkkoliikenteessä. 

Tästä syystä sitä ei suositella tuotantoympäristöihin. 

SNMPv3-käyttäjä 

SNMPv3 käyttää käyttäjätunnuksia ja tarvittaessa salausta. 

Esimerkiksi: 

1     monitor 

SNMPv3 mahdollistaa turvallisen monitoroinnin myös verkoissa, joissa liikenteen luottamuksellisuus on tärkeää. [cisco.com], [learningne....cisco.com] 

Tämän kurssin Week02-harjoituksessa opiskelija asentaa SNMP-agentin Linux-palvelimelle, määrittää monitorointikäyttäjän ja testaa tiedonkeruuta käytännössä. 

 

SNMP osana verkonhallinnan kokonaisuutta 

SNMP ei ole irrallinen teknologia, vaan osa laajempaa verkonhallinnan kokonaisuutta. 

1     Dokumentaatio 

2           ↓ 

3          SNMP 

4           ↓ 

5      Monitorointi 

6           ↓ 

7       Hälytykset 

8           ↓ 

9      Häiriönhallinta 

10           ↓ 

11       Kehittäminen 

Verkonhallinta alkaa ympäristön tuntemisesta ja dokumentoinnista. Dokumentoiduista laitteista voidaan kerätä tietoa SNMP:n avulla. Kerätty tieto mahdollistaa monitoroinnin, jonka perusteella syntyy hälytyksiä. Hälytysten avulla havaitaan häiriöt, jotka analysoidaan ja korjataan. Lopuksi kerättyä tietoa käytetään ympäristön kehittämiseen, kapasiteetin suunnitteluun ja automaation rakentamiseen.

Lähteet 

OpenTelemetry Documentation: Observability Primer 
https://opentelemetry.io/docs/concepts/observability-primer/ [opentelemetry.io], [opentelemetry.io] 

Cisco UCS SNMP Monitoring Guide 
https://www.cisco.com/c/en/us/td/docs/unified_computing/Intersight/IMM_SNMP_Monitoring/b_imm_snmp_monitoring_guide/m_overview_snmp_monitoring.pdf [cisco.com] 

Cisco Learning Network: Understanding SNMP 
https://learningnetwork.cisco.com/s/article/Understanding-Simple-Network-Management-Protocol--SNMP [learningne....cisco.com] 

RFC 5424: The Syslog Protocol 
https://www.rfc-editor.org/info/rfc5424/ [rfc-editor.org] 

Kentik: What is NetFlow? 
https://www.kentik.com/kentipedia/what-is-netflow-overview/ [kentik.com] 

Jatkolukemista 

Net-SNMP Project Documentation 
https://www.net-snmp.org/ 

LibreNMS Documentation 
https://docs.librenms.org/ 

Zabbix SNMP Monitoring Documentation 
https://www.zabbix.com/documentation/current/en/manual/config/items/itemtypes/snmp 

RFC 3411: SNMP Framework Architecture 
https://www.rfc-editor.org/rfc/rfc3411 

RFC 3418: Management Information Base (MIB-II) 
https://www.rfc-editor.org/rfc/rfc3418.html 