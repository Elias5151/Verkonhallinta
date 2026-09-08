Tehtävä 2.3

    Ensimmäinen kysely: "snmpwalk -v2c -c public web1 .1.3.6.1.2.1.1".
    järjestelmän nimi = web1
    käyttöjärjestelmä = Linux web1 6.18.33.2-microsoft-standard-WSL2
    uptime = 0:06:20.79

Tässä välissä asennettu mibs-downloader, jonka jälkeen snmp.conf tiedostosta laitettu "#mibs :"
aikaisemmassa vaiheessa käytetty tekoälyä OID-nimien kääntöön.

Tehtävä 2.4

    Järjestelmän nimi = web1
    Järjestelmän kuvaus = Linux web1 6.18.33.2-microsoft-standard-WSL2
    Käyttöaika =  0:18:18.52

Tehtävä 2.5

    Löytyi 3 verkkorajapintaa. 
        -lo
        -eth0
        -eth1
    rajapinta eth0 yhdistää verkkoon. Katsottu komennolla "ip route show".

Tehtävä 2.6

    sysName.0 = tarkoitus palauttaa nodelle annettu nimi
    sysDescr.0 = tarkoitus palauttaa tekstimuodossa kuvaus hakukohteesta
    sysUpTime.0 = tarkoitus palautta tieto kuinka kauan laite on ollut käynnissä
    ifDescr = tarkoitus palauttaa teksti, jossa on tietoa käyttöliittymästä
    ifOperStatus = tarkoitus palauttaa nykyhetkinen toimintatila käyttöliittymästä

Tehtävä 2.7

    web1
        - nimi = web1
        - käyttöjärjestelmä = Linux web1 6.18.33.2-microsoft-standard-WSL2
        - uptime = 1:07:46.44
    db1
        - nimi = db1
        - käyttöjärjestelmä = Linux web1 6.18.33.2-microsoft-standard-WSL2
        - uptime = 0:05:25.62
    branch-client
        - nimi = branch-client
        - käyttöjärjestelmö = Linux web1 6.18.33.2-microsoft-standard-WSL2
        - uptime = 0:03:33.01

Tehtävä 2.8

    snmp:llä voidaan kerätä keskitetysti tietoa verkkolaitteista. Tietoa voi kerätä esim. laitteiden suoriuskyvystä ja kuormituksesta. snmp:n avulla voi luoda esim. automaattihälytyksiä, jotka mahdollistavat proaktiivisen reagoinnin verkon eri laitteiden vikatilanteisiin. Tämä on erittäin hyödyllistä esim. saadaan snmp:n hakema ilmoitus hallintapaneeliin, että levytila on 92% käytetty, voidaan sitä lisätä ennen kuin käyttäjän laite ei enää toimi levytilan täyttymisen johdosta.

    snmpv2 ongelmana on sen huono tietoturva, koska se lähettää salasanan(yhteisömerkkijonon) selkokielisenä, eikä salaa liikennettä.

    snmpv3 on parempi vaihtoehto yrityksille, koska se tukee liikenteen salausta sekä käyttäjätunnus- salasana todennusta.

    Käyttäisin snmpv3 snmpv2 yrityksen tuotantoympäristössä paremman salauksen vuoksi.