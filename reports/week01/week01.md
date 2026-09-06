Tehtävä 1.1

    -r1 : toimii reitittimenä client1 ja attackerille sekä linkkinä r1-r2 välille.
    -r2 : toimiii reittimenä srv-sillalle, linkkinä r2-r1 välillä, linkkinä r2-management-sillalle ja linkkinä r2-r3 välillä.
    -r3 : toimiii linkkinä r3-r2 välillä ja reitittimenä sivukonttorin clientille.
    -client1 : On ubuntu:24.04 linuxia käyttävä päätelaite.
    -attacker : On kalilinuxia käyttävä päätelaite.
    -web1 : On ubuntu:24.04 linuxia käyttävä verkkopalvelin.
    -db1 : On ubuntu:24.04 linuxia käyttävä tietokantapalvelin.
    -branch-client : On ubuntu:24.04 linuxia käyttävä sivukonttorin päätelaite.
    -ansible : Käytetään automatisointiin, konfiguraationhallintaan ja sovellusten käyttöönottoon.
    -prometheus : Käytetään palveluiden, palvellimien ja sovellusteen tilan ja suorituskyvyn seurantaan.
    -grafana : Käytetään datan visualisointiin, seurantaan ja analysointiin.
    -zabbix : käytetään valvomaan it-infrastruktuurin tilaa ja suorituskykyä.


Tehtävä 1.3


Verkko	            Tarkoitus	                            Yhdyskäytävä

10.10.10.0/24		käyttäjän ja hyökkääjän verkko          10.10.10.1

10.10.20.0/24		verko web- ja tietokantapalvelimelle    10.10.20.1

10.10.30.0/24		osaston verkko                          10.10.30.1

10.10.99.0/24		verkko hallinointiin                    172.20.20.1

10.255.12.0/30		verkko r1-r2 välillä                    10.255.12.1, 10.255.12.2

10.255.23.0/30		verkko r2-r3 välillä                    10.255.23.1, 10.255.23.2


Tehtävä 1.4

    - Yhteys loytyy muihin verkoihin, paitsi managamenet laniin.
    - Liikenne kulkee r1, r2 ja r3 läpi branch clientille.


Yhteenveto

    - Reitityksen tutkiminen vei dokumentaatiossa eniten aikaa, koska kirjauduin eri verkkojen laitteille reitin tutkimista varten.
    - Verkon dokumentaatio auttaa tietämään mitä laitteita verkossa on ja miten ne on kytketty.