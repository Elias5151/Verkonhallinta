1. Johdanto
   - Prometheuksen toiminta perustuu aikasarjadataan ja pull-malliin. Prometheus käy säännölisin väliajoin hakemassa metriikat määritetyistä kohteista. Exporter kerää tietoja ja julkaisee ne HTTP-rajapinnan kautta. Prometheus lukee metriikat ja tallentaa ne aikasarjatietokantaan.
  
2. Node Exporterin käyttöönotto
   - Tarkistetaan että Node Exporter vastaa hakemalla metriikat /metrics kohteesta. Saatiin iso määrä tuloksia, joten Exporter toimii.
   - 
   - ![](https://github.com/Elias5151/Verkonhallinta/blob/main/reports/week03/images/Screenshot%202026-10-16%20165907.png "metriikat haku")

3. Prometheus
   - Avataan Prometheus selaimessa ja käydään tarkastamassa Status > Target Health osiosta serverin state.
   - Avataan myös Grafana selaimessa ja käydään lisäämässä yhteys Promtheukseen.
   - ![](https://github.com/Elias5151/Verkonhallinta/blob/main/reports/week03/images/Screenshot%202026-10-16%20165958.png)
   - ![](https://github.com/Elias5151/Verkonhallinta/blob/main/reports/week03/images/Screenshot%202026-10-16%20170147.png)
   - Kuten kuvista nähdään state on up, joten kaikki kunnossa.
  
4. Dashboard
   - Grafanaan luotu dashboard, jossa visualisoidaan Prometheuksen keräämää dataa.
   - ![](https://github.com/Elias5151/Verkonhallinta/blob/main/reports/week03/images/Screenshot%202026-10-16%20190402.png)

5. Kuormitustesti
   - Kuormitustesti mahtaa olla osittain epäonnistunut, koska verkkoliikenteessä ei näkynyt muutoksia.
   - CPU käyttöaste nousi noin 5% stress-ng työkalua käyttäen.
   - Levytilassa ei näkynyt kovin merkittävää muutosta testfile.img ajon jälkeen.
   - ![](https://github.com/Elias5151/Verkonhallinta/blob/main/reports/week03/images/Screenshot%202026-10-16%20172344.png)
   - ![](https://github.com/Elias5151/Verkonhallinta/blob/main/reports/week03/images/Screenshot%202026-10-16%20173120.png)
   - ![](https://github.com/Elias5151/Verkonhallinta/blob/main/reports/week03/images/Screenshot%202026-10-16%20173133.png)
   - ![](https://github.com/Elias5151/Verkonhallinta/blob/main/reports/week03/images/Screenshot%202026-10-16%20173154.png)

6. SNMP vs Prometheus

| Ominaisuus | SNMP | Prometheus |
| :--- | :--- | :--- |
| **Tiedonkeruu** | SNMP tekee kyselyitä laitteille tai vastaanottaa niiden lähettämiä ilmoituksia. | Prometheus hakee säännöllisesti dataa exporterilta. |
| **Käyttöönotto** | SNMP:ssä tarkasteltava kohde vaatii snmp-agentin asennuksen ja tarkastelija snmp-serverin. | Prometheus vaatii exporterin asentamisen tarkasteltavaan kohteeseen. |
| **Mittarien määrä** | Yleensä vain laitevalmistajien määrittämät perusasiat. | Todella laaja, voi kerätä mitä tahansa dataa. |
| **Visualisointi** | Vaatii erillisen taustajärjestelmän. | Yhdistetään melkein aina Grafanaan, jolla saa hienot ja selkeät graafit. |
| **Hälytysmahdollisuudet** | Perustuu yksinkertaisiin raja-arvoihin. | Saa monipuolisesti tehtyä hälytyksiä. |
| **Soveltuvuus pilviympäristöihin** | Huono, toimii parhaiten perinteisissä konesaleissa, joissa asiat eivät muutu. | Hyvä, tehty pilveä varten. Löytää uudet tai poistuvat koneet automaattisesti. |

7. Yhteenveto
Prometheksella saadan monipuolisemmin kyseltyä dataa kuin SNMP:llä. Prometheus soveltuu myös paremmin pilveen sen automaattisen tunnistuksen johdosta.
Ylläpitäjän kannattaa seurata seuraavia mittareita jatkuvasti:
  - (CPU) käyttöaste ja iowait
  - (RAM) vapaan muistin määrä ja swapin käyttö
  - (Levytila) Jäljellä oleva levytila sekä luku- ja kirjoitusnopeudet
  - (Verkko) Liikenteen määrä IN/OUT ja mahdolliset paketin hukkumiset
  - (Palvelut) Ovatko kriittiset prosessit käynnissä ja vastaavatko ne pyyntöihin
Dashboardini tarjoaa tiedon CPU:n, RAM:in ja Levyn käyttöasteen prosentteina sekä verkon lähettämmän ja vastaanotetus datan määärän tavuina.
Lisäisin dashboardiin ainakin packetloss graafin sekä levyn nopeudet.
Monitorointi data auttaa vianetsinnässä paljon. Esim, jos jossain järjestelmässä ilmenisi hitautta, voitaisiin katsoa graafia jossa näkyisi, että CPU käyttöaste on > 90%.
Harjoituksessa opin ottamaan Grafan käyttöön ja luomaan sinne visualisointeja Prometheuksen keräämstä datasta.
